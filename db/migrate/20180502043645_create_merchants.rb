class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.integer :merchant_id
      t.string :name

      t.timestamps
    end
  end
end
