class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :jailbird_pin, length: { is: 4 }
  validates :phone_number, phone: true, if: "!phone_number.nil?"
  validates :phone_number, uniqueness: true, if: "!phone_number.nil?"


  has_many :groups, dependent: :destroy
  has_many :contacts, dependent: :destroy

  attr_accessible :email, :password_confirmation, :password, :uid,
                  :provider, :remember_me, :phone_number, :jailbird_pin

  before_validation :sanitize_number
  after_create :default_groups

  def sanitize_number
    if self.phone_number
      phone = Phonelib.parse(self.phone_number)
      self.phone_number = "#{phone.sanitized}"
    end
  end

  def default_groups
    self.groups << Group.create(name: "Favorites")
    self.groups << Group.create(name: "Friends")
    self.groups << Group.create(name: "Family")

    g = self.groups.where(name: 'Favorites').first
    g.favorite = true
    g.save

  end

end
