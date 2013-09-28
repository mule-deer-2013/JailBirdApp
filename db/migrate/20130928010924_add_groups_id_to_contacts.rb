class AddGroupsIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :group_id, :integer
  end
end
