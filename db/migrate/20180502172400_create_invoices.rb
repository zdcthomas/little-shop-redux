class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :merchant_id, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
