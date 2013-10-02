module ApiHelper

  def contact_list
    contacts = current_user.contacts
    friends = {}

    contacts.each do |contact|
      friends[contact.phone_number] = contact.name
    end

    friends
  end

end
