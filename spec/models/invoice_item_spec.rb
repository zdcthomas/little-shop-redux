RSpec.describe InvocieItem do 
  describe 'An Instance of InvoiceItem' do
    it 'Exists' do
      inv_item = InvoiceItem.new(id: 1, item_id: 20, invoice_id: 25, quantity: 5, unit_price: 13567)

      expect(inv_item).to be_instance_of(InvoiceItem)
    end

    it 'Has an item_id' do
      inv_item = InvoiceItem.create(id: 1, item_id: 20, invoice_id: 25, quantity: 5, unit_price: 13567)

      expect(inv_item.item_id).to eq.(20)
    end

    it 'Has an invoice_id' do
      inv_item = InvoiceItem.create(id: 1, item_id: 20, invoice_id: 25, quantity: 5, unit_price: 13567)

      expect(inv_item.invoice_id).to eq.(25)
    end

    it 'Has a quantity' do
      inv_item = InvoiceItem.create(id: 1, item_id: 20, invoice_id: 25, quantity: 5, unit_price: 13567)

      expect(inv_item.quantity).to eq.(5)
    end

    it 'Has a unit_price' do
      inv_item = InvoiceItem.create(id: 1, item_id: 20, invoice_id: 25, quantity: 5, unit_price: 13567)

      expect(inv_item.unit_price).to eq.(13567)
    end
  end

  describe "Invoice Item's validations" do
    it 'should be invalid if missing a item id' do
      invoice_item = InvoiceItem.new(id: 1, invoice_id: 25, quantity: 5, unit_price: 13567)
      expect(invoice_item).to_not be_valid
    end

    it 'should be invalid if missing a invoice id' do
      invoice_item = InvoiceItem.new(id: 1, item_id: 20, quantity: 5, unit_price: 13567)
      expect(invoice_item).to_not be_valid
    end

    it 'should be invalid if missing a quantity ' do
      invoice_item = InvoiceItem.new(id: 1, item_id: 20, invoice_id: 25, unit_price: 13567)
      expect(invoice_item).to_not be_valid
    end

    it 'should be invalid if missing a unit price ' do
      invoice_item = InvoiceItem.new(id: 1, item_id: 20, invoice_id: 25, quantity: 5)
      expect(invoice_item).to_not be_valid
    end

  end
end