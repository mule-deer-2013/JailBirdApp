module ApiHelper

  def contact_list
    contacts = Contact.all
    friends = {}

    contacts.each do |contact|
      friends[contact.phone_number] = contact.name
    end

    friends
  end

end
