class Group < ActiveRecord::Base
  attr_accessible :name, :contact_ids
  attr_protected :favorite

  validates :name, :user_id, presence: true
  validates :favorite, uniqueness: { scope: :user_id, message: "should only have one favorite group" }, if: :favorite_is_true?

  belongs_to :user
  has_many :contacts_groups
  has_many :contacts, through: :contacts_groups

  def favorite_is_true?
    favorite == true
  end

end
x
