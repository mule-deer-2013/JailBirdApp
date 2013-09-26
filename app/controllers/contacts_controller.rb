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


end
