class ContactsController < ApplicationController

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

  def edit
    @contact = Contact.find(params[:id])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully Updated"
      redirect_to root_path
    else
      render edit_group_path
    end

  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to root_path
  end

  def index
    @contacts = Contact.all
    @groups = Group.all
  end

end
