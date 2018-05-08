class FixPriceColumn < ActiveRecord::Migration[5.2]
  def change
    create_table :items, force: :cascade do |t|
    t.text     :title
    t.text     :description
    t.integer  :price
    t.text     :img
    t.integer  :merchant_id

    t.timestamps  null: false
  end
end
end
