class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :sale_quantity
      t.decimal :sale_price

      t.timestamp
    end
  end
end
