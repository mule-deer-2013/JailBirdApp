class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :jailbird_pin, length: { is: 4 }

  has_many :groups, dependent: :destroy
  has_many :contacts, dependent: :destroy

  attr_accessible :email, :password_confirmation, :password, :uid,
                  :provider, :remember_me, :phone_number, :jailbird_pin

  before_save :sanitize_number
  after_create :default_groups

  def sanitize_number
    if self.phone_number
      phone = Phonelib.parse(self.phone_number)
      self.phone_number = "#{phone.sanitized}"
    end
  end

  def default_groups
    self.groups << Group.create(name: "Favorites", favorite: true)
    self.groups << Group.create(name: "Friends")
    self.groups << Group.create(name: "Family")
  end

end
