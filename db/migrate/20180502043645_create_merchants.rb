class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.integer :id
      t.text :name

      t.timestamps null: false
  end
end
