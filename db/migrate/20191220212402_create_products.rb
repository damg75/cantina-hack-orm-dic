class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.integer :product_quantity
      t.decimal :selling_price

      t.timestamp
    end
  end
end
