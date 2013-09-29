class AddDeviseToUsers < ActiveRecord::Migration

  def change
    rename_column :users, :password_digest, :encrypted_password
    remove_columns :users, :remember_token, :access_token, :refresh_token, :expires_in, :issued_at
    add_column :users, :remember_created_at, :datetime
    add_index :users, :email, :unique => true
  end

end
