class User < ActiveRecord::Base

	attr_accessible :email, :username, :password

	has_secure_password

	validates :email, :username, :password, presence: true
	validates :email, uniqueness: true

  has_many :contacts
  has_many :groups
  before_save :create_remember_token

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
