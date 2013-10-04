require 'nokogiri'

class ContactsController < ApplicationController
  before_filter :authenticate_user!

  def index
    unless current_user.phone_number
      render "/start/index"
    end
    @contacts = current_user.contacts
    @page = params[:page].to_i
    @groups = current_user.groups.limit(3).offset(params[:page].to_i * 3)
    div, mod = ((current_user.groups.length).divmod(3))
    if div == 0
      @max_page = 0
    elsif mod == 0
      @max_page = div
    else
      @max_page = div
    end
  end

  def new
    @contact = Contact.new
    render layout: false
  end

  def create
    u = current_user.contacts.build(params[:contact])
    if u.save
      flash[:notice] = "Successfully Created!"
    end
    flash[:errors] = u.errors.full_messages
    redirect_to contacts_path
  end

  def edit
    @contact = Contact.find(params[:id])
    render layout: false
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully Updated!"
    end
    flash[:errors] = contact.errors.full_messages
    redirect_to contacts_path
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to contacts_path
  end

  def import
    import_email = user_gmail(google_auth_token)
    contacts_response = google_contacts(import_email, google_auth_token)
    @imported_contacts = parse_xml_contacts(contacts_response)
    flash[:error] = "No contacts with mobile numbers found." if @imported_contacts.empty?
    render :import
  end

  def add_imports
    fail_array = Contact.importer(params['contacts'], current_user)
    if fail_array.length > 0
      @message = fail_array.join(", ") + "were not added."
    else
      @message = "All contacts were added successfully!"
    end
    render :partial => 'import_success', layout: false
  end

  def about
    render :about
  end

  private

  def parse_xml_contacts(contacts_response)
    parsed_contacts = []
    xml_contacts = Nokogiri::XML(contacts_response)
    xml_contacts.css('entry').each do |node|
      phone_number_tags = node.xpath('gd:phoneNumber')
      phone_number_types = phone_number_tags.map { |phone_tag| phone_tag.attr('rel').match(/[^#]\w+$/).to_s.to_sym unless phone_tag.attr('rel').nil? }
      if phone_number_tags[0] != nil && phone_number_types.include?(:mobile)
        contact = { name: node.at_css('title').text }
        phone_numbers = phone_number_tags.map { |phone_tag| phone_tag.inner_text }
        contact.merge!(Hash[phone_number_types.zip(phone_numbers)].delete_if {|k, v| k != :mobile })
        parsed_contacts << contact
      end
    end
    parsed_contacts
  end
end
