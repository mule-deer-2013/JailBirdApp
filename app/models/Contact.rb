class Contact < ActiveRecord::Base
  attr_accessible :phone_number, :name

  belongs_to :user
  has_and_belongs_to_many :groups
  
  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
  validates :phone_number, phone: true

  before_save :sanitize_number

  def sanitize_number
    self.phone_number = "+" + Phonelib.parse(self.phone_number).sanitized
  end
end
