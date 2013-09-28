class Group < ActiveRecord::Base
  attr_accessible :name, :contact_ids

  validates :name, presence: true

  has_and_belongs_to_many :contacts
  belongs_to :user
end
