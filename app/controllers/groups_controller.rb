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
  end

  def show
    @group = Group.find(params[:id])
  end

end
