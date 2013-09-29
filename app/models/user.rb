class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password_confirmation, :password, :uid, :provider

end
