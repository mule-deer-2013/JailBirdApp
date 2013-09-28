class Group < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :contacts
  belongs_to :user
end