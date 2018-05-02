RSpec.describe Invoice do
  describe 'instantiation' do
    it 'should exist' do
      invoice = Invoice.new(id: 1, merchant_id: 12335938, customer_id: 1, status: 'pending')
      expect(invoice).to be_instance_of(Invoice)
    end
  end

  describe 'validations' do

    describe 'required fields' do

      it 'should be invalid if missing a merchant id' do
        invoice = Invoice.new(id: 1, customer_id: 1, status: 'pending')
        expect(invoice).to_not be_valid
      end

      it 'should be invalid if missing a status' do
        invoice = Invoice.new(id: 1, merchant_id: 12335938, customer_id: 1)
        expect(invoice).to_not be_valid
      end

    end

  end
end
