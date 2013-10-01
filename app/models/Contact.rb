class Contact < ActiveRecord::Base
  attr_accessible :phone_number, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :groups

  validates_presence_of :name, :phone_number
  validates :phone_number, uniqueness: true, phone: true

  before_save :sanitize_number

  def sanitize_number
    phone = Phonelib.parse(self.phone_number)
    self.phone_number = "+" + "#{phone.sanitized}"
  end
end
