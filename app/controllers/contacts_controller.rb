class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @groups = Group.all
  end

  def new
    @contact = Contact.new
  end

  def create
    p params[:contact]
    u = Contact.new(params[:contact])

    unless u.save
      @errors = u.errors.full_messages
      render new_user_path
    end

    redirect_to :root
  end

end
