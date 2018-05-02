require 'minitest/autorun'
require 'minitest/pride'
require './app/models/invoice'

class InvoiceTest < Minitest::Test
  def test_it_exists
    invoice = Invoice.new(id: 1, customer_id: 1, merchant_id: 12335938, status: 'pending',)
    assert_instance_of Invoice, invoice
  end
end