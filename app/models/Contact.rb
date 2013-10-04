class Contact < ActiveRecord::Base
  attr_accessible :phone_number, :name, :user_id

  belongs_to :user
  has_many :contacts_groups
  has_many :groups, through: :contacts_groups

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: {scope: :user_id, message: "is already associated with another contact"}
  validates :phone_number, phone: true

  before_validation :sanitize_number

  def sanitize_number
    self.phone_number = "+" + Phonelib.parse(self.phone_number).sanitized
  end

  def self.importer(contacts_hash, current_user)
    invalid_array = []
    contacts_hash.each_value do |contact_params|
      contact_params['name'].strip!
      import = current_user.contacts.build(contact_params)
      invalid_array << contact_params['name'] unless import.save
    end
    invalid_array
  end

end
