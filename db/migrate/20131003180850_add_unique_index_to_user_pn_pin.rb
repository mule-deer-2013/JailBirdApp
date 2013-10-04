class AddUniqueIndexToUserPnPin < ActiveRecord::Migration
  def change
    add_index :users, :phone_number
    add_index :users, :jailbird_pin
  end
end
