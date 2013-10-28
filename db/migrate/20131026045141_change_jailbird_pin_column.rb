class ChangeJailbirdPinColumn < ActiveRecord::Migration
  def up
  	remove_index :users, :column => :jailbird_pin
  	rename_column :users, :jailbird_pin, :old_jailbird_pin
  	add_column :users, :encrypted_jailbird_pin, :string, :default => User.encrypt(:jailbird_pin, "0000")
  	User.all.each do |user|
  		user.jailbird_pin = user.old_jailbird_pin
  		user.save
  	end
  	remove_column :users, :old_jailbird_pin
  	add_index :users, :encrypted_jailbird_pin
  end

  def down
  	remove_index :users, :column => :encrypted_jailbird_pin
  	add_column :users, :old_jailbird_pin, :string, :default => "0000"
  	User.all.each do |user|
  		user.encrypted_jailbird_pin = user[:encrypted_jailbird_pin]
  		user.old_jailbird_pin = user.jailbird_pin
  		user.save
  	end
  	rename_column :users, :old_jailbird_pin, :jailbird_pin
  	remove_column :users, :encrypted_jailbird_pin
  	add_index :users, :jailbird_pin
  end
end
