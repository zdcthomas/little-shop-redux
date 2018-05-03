RSpec.describe Merchant do

  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if there is no name' do
        merchant = Merchant.create()
        # require 'pry'; binding.pry

        expect(merchant).to_not be_valid
      end

      it 'has merchant id' do
        merchant = Merchant.create(name: 'Shopin1901')
        expect(merchant.id).to eq(1)
      end
    end
  end
end
