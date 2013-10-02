class Group < ActiveRecord::Base
  attr_accessible :name, :contact_ids

  validates :name, presence: true

  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :contacts
end