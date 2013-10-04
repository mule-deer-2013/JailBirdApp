class ContactsGroup < ActiveRecord::Base
	belongs_to :contact
	belongs_to :group

	validates :contact_id, uniqueness: { scope: :group_id }
end