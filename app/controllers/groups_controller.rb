class GroupsController < ApplicationController

  def new
    @group = Group.new
    @contacts = Contact.all
    render layout: false

  end

  def create

    g = current_user.groups.build(params[:group])
      unless g.save
      flash[:errors] = g.errors.full_messages
      redirect_to new_group_path
    else
      redirect_to contacts_path
    end
  end

  def edit
    @group = Group.find(params[:id])
    @contacts = Contact.all
    render layout: false

  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    params[:group][:contact_ids] ||= []
    group = Group.find(params[:id])
    if group.update_attributes(params[:group])
      flash[:notice] = "Successfully Updated!"
      redirect_to contacts_path
    else
      flash[:errors] = contact.errors.full_messages
      render edit_group_path
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to contacts_path
  end

end
