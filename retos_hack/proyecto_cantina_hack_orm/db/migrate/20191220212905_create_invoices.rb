class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.date :invoice_date

      t.timestamp
    end
  end
end
