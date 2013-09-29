class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    u = Contact.new(params[:contact])
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

  def index
    @contacts = Contact.all
    @groups = Group.all
  end

end
