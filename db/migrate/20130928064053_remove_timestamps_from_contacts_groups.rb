class RemoveTimestampsFromContactsGroups < ActiveRecord::Migration
  def up
    remove_column :contacts_groups, :created_at
    remove_column :contacts_groups, :updated_at
  end

  def down
    add_column :contacts_groups, :updated_at, :string
    add_column :contacts_groups, :created_at, :string
  end
end
