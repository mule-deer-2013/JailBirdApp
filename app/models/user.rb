class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password_confirmation, :password, :uid, :provider

	# has_secure_password

	# validates :email, :username, :password, presence: true
	# validates :email, uniqueness: true

  # before_save :create_remember_token

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uidd = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.avatar = auth.info.image
      end
    end
  end

  # private

  # def create_remember_token
  #   self.remember_token = SecureRandom.urlsafe_base64
  # end

end