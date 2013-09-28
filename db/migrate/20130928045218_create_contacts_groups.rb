class CreateContactsGroups < ActiveRecord::Migration
  def change
    create_table :contacts_groups do |t|
      t.references :contact
      t.references :group
      t.timestamps
    end
  end
end
