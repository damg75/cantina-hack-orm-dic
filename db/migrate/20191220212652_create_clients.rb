class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_last_name
      t.string :client_rif
      t.string :client_address
      t.string :client_email
      t.string :client_phone
      t.decimal :client_balance

      t.timestamp
    end
  end
end
