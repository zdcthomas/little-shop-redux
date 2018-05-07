require './app/models/merchant.rb'
require './app/models/invoice.rb'
require 'CSV'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
  Merchant.create(id: m[:id],
                  name: m[:name],
                  created_at: m[:created_at],
                  updated_at: m[:updated_at]
                  )
  end
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
end

