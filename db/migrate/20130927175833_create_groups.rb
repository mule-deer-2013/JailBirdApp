class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :user
      t.references :contact

      t.timestamps
    end
  end
end
