# read in from CSV
require './app/models/item.rb'
require 'CSV'

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |i|
  Item.create(id: i[:id],
                  name: i[:name],
                  description: i[:description],
                  unit_price: i[:price],
                  merchant_id: i[:merchant_id],
                  image: i['']
                  created_at: i[:created_at],
                  updated_at: i[:updated_at])
end
