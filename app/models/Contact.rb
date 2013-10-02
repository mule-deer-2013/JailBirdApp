class Contact < ActiveRecord::Base
  attr_accessible :phone_number, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: {scope: :user_id, message: "is already associated with another contact"}
  validates :phone_number, phone: true

  before_validation :sanitize_number

  def sanitize_number
    self.phone_number = "+" + Phonelib.parse(self.phone_number).sanitized
  end
end
