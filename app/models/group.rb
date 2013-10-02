class Group < ActiveRecord::Base
  attr_accessible :name, :contact_ids

  validates :name, presence: true

  belongs_to :user
  has_many :contacts_groups
  has_many :contacts, through: :contacts_groups
end