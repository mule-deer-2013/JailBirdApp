class User < ActiveRecord::Base
	attr_accessible :email, :name, :password

	has_secure_password

	validates :email, :name, :password, presence: true
	validates :email, uniqueness: true

end