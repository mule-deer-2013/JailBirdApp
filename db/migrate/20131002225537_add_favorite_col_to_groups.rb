class AddFavoriteColToGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :favorite, :boolean, default: false
  end

  def down
  	remove_column :groups, :favorite
  end
end
