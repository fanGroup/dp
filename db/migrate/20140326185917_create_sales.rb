class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date
      t.float :amount

      t.timestamps
    end
  end
end
