# read in from CSV
require './app/models/item.rb'
require 'CSV'

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |i|
      Item.create(id: i[:id],
                  title: i[:title],
                  description: i[:description],
                  price: i[:unit_price],
                  img: i['https://i.imgur.com/47sZdlE.jpg'],
                  merchant_id: i[:merchant_id],
                  created_at: i[:created_at],
                  updated_at: i[:updated_at])
end
