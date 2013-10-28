module ApiHelper

  def contact_list
    contacts = current_user.contacts
    friends = {}

    contacts.each do |contact|
      friends[contact.phone_number] = contact.name
    end

    friends
  end

  def retrieve_jailbird_user(phone_number, pin)
		User.find_by_phone_number_and_encrypted_jailbird_pin(phone_number, User.encrypt(:jailbird_pin, pin))
	end

end
