class GroupsController < ApplicationController

  def new
    @group = Group.new
    @contacts = current_user.contacts
    render layout: false
  end

  def create
    g = current_user.groups.build(params[:group])
    unless g.save
      flash[:errors] = g.errors.full_messages
    end
      redirect_to contacts_path
  end

  def edit
    @group = Group.find(params[:id])
    @contacts = current_user.contacts
    render layout: false

  end

  def show
    @group = Group.find(params[:id])
    render layout: false
  end

  def update
    params[:group][:contact_ids] ||= []
    group = Group.find(params[:id])
    if group.update_attributes(params[:group])
      flash[:notice] = "Successfully Updated!"
    end
      flash[:errors] = group.errors.full_messages
      redirect_to contacts_path
  end

  def dragging_update
    group = Group.find(params[:id])
    contact = Contact.find(params[:group][:contact_ids])
    group.contacts << contact
    redirect_to contacts_path
  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to contacts_path
  end

  def paginate
    @page = params[:page].to_i
    @groups = current_user.groups.limit(3).offset(params[:page].to_i * 3)
    div, mod = ((current_user.groups.length).divmod(3))
    if div == 0
      @max_page = 0
    elsif mod == 0
      @max_page = div -1
    else
      @max_page = div
    end

    render :partial => 'contacts/users_groups', layout: false

  end

end

