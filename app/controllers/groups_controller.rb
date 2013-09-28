class GroupsController < ApplicationController

  def new
    @group = Group.new
    @contacts = Contact.all
  end

  def create
    p params
    g = Group.new(params[:group])

    unless g.save
      @errors = g.errors.full_messages
      render new_group_path
    end

    redirect_to :root
  end

  def edit
    @group = Group.find(params[:id])
    @contacts = Contact.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    params[:group][:contact_ids] ||= []
    group = Group.find(params[:id])

    if group.update_attributes(params[:group])
      flash[:notice] = "Successfully Updated"
      redirect_to root_path
    else
      render edit_group_path
    end

  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to root_path
  end

end
