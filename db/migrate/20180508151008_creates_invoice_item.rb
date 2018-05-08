class CreatesInvoiceItem < ActiveRecord::Migration[5.2]
  def change
    create_table "invoice_items", force: :cascade do |inv_item|
      inv_item.integer       :item_id
      inv_item.integer       :invoice_id
      inv_item.integer       :quantity
      inv_item.integer       :unit_price

      inv_item.timestamps null: false
  end
end
