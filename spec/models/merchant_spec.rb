RSpec.describe Merchant do

  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if there is no name' do
        merchant = Merchant.create(id: 1234567)

        expect(merchant).to_not be_valid
      end

      it 'has merchant id' do
        merchant = Merchant.create(id: 12334105, name: 'Shopin1901')

        expect(merchant.name).to eq('Shopin1901')
      end
    end
  end
end
