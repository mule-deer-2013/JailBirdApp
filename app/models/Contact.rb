class Contact < ActiveRecord::Base
  attr_accessible :phone_number, :name

  belongs_to :user
  has_many :groups

  validates_presence_of :name, :phone_number
  validates :phone_number, format: { with: /^(1.)*\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})(\s*x[0-9]*)*$/, message: "please enter a valid phone number"}
end
