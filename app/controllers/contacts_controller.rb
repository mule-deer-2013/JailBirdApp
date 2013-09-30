class ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts
    @groups = current_user.groups
  end

  def new
    @contact = Contact.new
  end

  def create
    u = current_user.contacts.build(params[:contact])
    unless u.save
      flash[:errors] = u.errors.full_messages
      redirect_to new_contact_path
    else
      redirect_to root_path
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully Updated!"
      redirect_to root_path
    else

      flash[:errors] = contact.errors.full_messages
      redirect_to edit_contact_path
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to root_path
  end

  def import
    @imported_contacts = []
    auth = GOOGLE_CLIENT.authorization.dup
    auth.redirect_uri = 'http://localhost:3000/contacts/import'
    auth.update_token!(session)
    auth.code = params[:code] if params[:code]
    auth.fetch_access_token!
    contacts_response = RestClient.get "https://www.google.com/m8/feeds/contacts/#{current_user.email}/full?access_token=#{auth.access_token}&max-results=1000"
    xml_contacts = Nokogiri::XML(contacts_response)
    xml_contacts.css('entry').each do |node|
      phone_number_tags = node.xpath('gd:phoneNumber')
      phone_number_types = phone_number_tags.map { |phone_tag| phone_tag.attr('rel').match(/[^#]\w+$/).to_s.to_sym }
      if phone_number_tags[0] != nil && phone_number_types.include?(:mobile)
        contact = { name: node.at_css('title').text }
        phone_numbers = phone_number_tags.map { |phone_tag| phone_tag.inner_text }
        contact.merge!(Hash[phone_number_types.zip(phone_numbers)].delete_if {|k, v| k != :mobile })
        @imported_contacts << contact
      end
    end
    render :import
  end

end
