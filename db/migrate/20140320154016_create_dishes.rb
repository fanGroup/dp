class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
