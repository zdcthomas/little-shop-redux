# read in from CSV
require './app/models/item.rb'
require './app/models/merchant.rb'
require './app/models/invoice.rb'
require 'CSV'

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |i|
<<<<<<< HEAD
      Item.create(id: i[:id],
                  title: i[:title],
                  description: i[:description],
                  price: i[:unit_price],
                  img: i['https://i.imgur.com/47sZdlE.jpg'],
                  merchant_id: i[:merchant_id],
                  created_at: i[:created_at],
                  updated_at: i[:updated_at])
=======
  Item.create(id: i[:id],
              title: i[:title],
              description: i[:description],
              unit_price: i[:price],
              img: i['https://slack-imgs.com/?c=1&url=https%3A%2F%2Fassets3.thrillist.com%2Fv1%2Fimage%2F1299823%2Fsize%2Ftl-horizontal_main.jpg'],
              merchant_id: i[:merchant_id],
              created_at: i[:created_at],
              updated_at: i[:updated_at]
              )
>>>>>>> master
end

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
  Merchant.create(id: m[:id],
                  name: m[:name],
                  created_at: m[:created_at],
                  updated_at: m[:updated_at]
                  )
  
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  Invoice.create( id: invoice[:id],
                  customer_id: invoice[:customer_id],
                  merchant_id: invoice[:merchant_id],
                  status: invoice[:status],
                  created_at: invoice[:created_at],
                  updated_at: invoice[:updated_at]
                  )
end

