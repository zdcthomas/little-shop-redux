# read in from CSV
require './app/models/item.rb'
require './app/models/merchant.rb'
require './app/models/invoice.rb'
require 'CSV'

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(id: item[:id],
              name: item[:name],
              description: item[:description],
              unit_price: item[:unit_price],
              merchant_id: item[:merchant_id],
              img: 'https://assets3.thrillist.com/v1/image/1299823/size/tl-horizontal_main.jpg',
              created_at: item[:created_at],
              updated_at: item[:updated_at]
              )
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

