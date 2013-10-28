class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_encryptor :jailbird_pin, :key => ENV['PIN_KEY']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :jailbird_pin, length: { is: 4 }
  validates :jailbird_pin, format: { with: /\A\d{4}\z/, message: "only allows 4-digit numbers" }
  validates :phone_number, phone: true, if: "!phone_number.nil?"
  validates :phone_number, uniqueness: true, if: "!phone_number.nil?"

  has_many :groups, dependent: :destroy
  has_many :contacts, dependent: :destroy

  attr_accessible :email, :password_confirmation, :password, :uid,
                  :provider, :remember_me, :phone_number, :jailbird_pin

  before_validation :sanitize_number, :get_pin_number
  before_save :encrypt_jailbird_pin
  after_create :default_groups

  def sanitize_number
    if self.phone_number
      phone = Phonelib.parse(self.phone_number)
      self.phone_number = "#{phone.sanitized}"
    end
  end

  private

  def default_groups
    self.groups << Group.create(name: "Favorites")
    self.groups << Group.create(name: "Friends")
    self.groups << Group.create(name: "Family")

    g = self.groups.where(name: 'Favorites').first
    g.favorite = true
    g.save
  end

  def encrypt_jailbird_pin
    self[:encrypted_jailbird_pin] = self.encrypted_jailbird_pin if self.jailbird_pin
  end

  def get_pin_number
    if self[:encrypted_jailbird_pin]
      self.encrypted_jailbird_pin = self[:encrypted_jailbird_pin]
    else
      self.jailbird_pin = self[:jailbird_pin]
    end
  end

end
