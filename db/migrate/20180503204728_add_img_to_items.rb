class AddImgToItems < ActiveRecord::Migration[5.2]
  def change
  create_table "items", force: :cascade do |t|
  t.text     "title"
  t.text     "description"
  t.integer  "price"
  t.text     "./default-photo.png"
    end
  end
end
