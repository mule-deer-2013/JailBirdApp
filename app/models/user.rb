class User < ActiveRecord::Base
	attr_accessible :email, :username

	has_secure_password

	validates :email, :username, :password, presence: true
	validates :email, uniqueness: true

  has_many :contacts
  has_many :groups
end