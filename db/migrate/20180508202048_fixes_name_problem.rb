class FixesNameProblem < ActiveRecord::Migration[5.2]
  def change
    create_table :items, force: :cascade do |t|
    t.text     :name
    t.text     :description
    t.integer  :unit_price
    t.text     :img
    t.integer  :merchant_id

    t.timestamps  null: false
    end
  end
end
