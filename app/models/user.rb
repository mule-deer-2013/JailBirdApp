class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :phone_number, uniqueness: true, phone: true
  # validates :jailbird_pin, length: { is: 4 }
  has_many :contacts
  has_many :groups

  attr_accessible :email, :password_confirmation, :password, :uid,
                  :provider, :remember_me, :phone_number, :jailbird_pin

  # before_save :sanitize_number

  # def sanitize_number
  #   if self.phone_number
  #   phone = Phonelib.parse(self.phone_number)
  #   self.phone_number = "#{phone.sanitized}"
  #   end
  # end

end
