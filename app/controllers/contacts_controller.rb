class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    u = Contact.new(params[:contact])
    
    unless u.save
      @errors = u.errors.full_message
    end

    redirect_to :root
  end

  def import
    auth = GOOGLE_CLIENT.authorization.dup
    auth.redirect_uri = 'http://localhost:3000/contacts/import'
    auth.update_token!(session)
    auth.code = params[:code] if params[:code]
    auth.fetch_access_token!
    google_contacts = RestClient.get "https://www.google.com/m8/feeds/contacts/#{current_user.email}/full?access_token=#{auth.access_token}"
    render :xml => google_contacts
  end

end
