# read in from CSV
require './app/models/item.rb'
require 'CSV'

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |i|
      Item.create(id: i[:id],
                  title: i[:title],
                  description: i[:description],
                  unit_price: i[:price],
                  merchant_id: i[:merchant_id],
                  img: i['Users/jamisonordway/desktop/turing/2module/projects/little-shop-redux/images/default-photo.png'],
                  created_at: i[:created_at],
                  updated_at: i[:updated_at])
end
