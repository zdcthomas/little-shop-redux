RSpec.describe Merchant do
  describe 'validations' do
    describe 'required fields' do
      it 'should be invalid if there is no name' do
        merchant = Merchant.create()

        expect(merchant).to_not be_valid
      end

      it 'has merchant id' do
        merchant = Merchant.create(name: 'Shopin1901')

        expect(merchant.id).to eq(1)
      end
    end
  end
  describe "class methods" do
    describe "all_items" do
      it 'should return and array of all items associated with a merchant' do
        Merchant.create(name: 'Shopin1901')
        item1 = Item.create(title: 't-shirt', description: 'you can wear it if you want', unit_price: 1000, img: './default-photo.png', merchant_id: 1)
        item2 = Item.create(title: 'another item', description: 'you can wear it if you want', unit_price: 1000, img: './default-photo.png', merchant_id: 1)
        item3 = Item.create(title: 'wait, no, another item', description: 'you can wear it if you want', unit_price: 1000, img: './default-photo.png', merchant_id: 1)

        expect(Merchant.all_items(1)).to eq([item1, item2, item3])
      end
    end
  end
end
