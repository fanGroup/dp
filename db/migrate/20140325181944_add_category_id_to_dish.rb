class AddCategoryIdToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :category_id, :int
  end
end
