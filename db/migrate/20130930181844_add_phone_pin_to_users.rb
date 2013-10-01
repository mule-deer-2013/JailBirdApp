class AddPhonePinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :jailbird_pin, :string
  end
end