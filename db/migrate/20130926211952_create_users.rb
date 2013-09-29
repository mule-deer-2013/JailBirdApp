class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :email
  		t.string :password_digest
  		t.string :remember_token
  		t.string :access_token
  		t.string :refresh_token
      t.string :expires_in
      t.string :issued_at
  		t.timestamps
  	end
  end
end
