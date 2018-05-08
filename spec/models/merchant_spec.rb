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
    describe "all item" do
      it 'should return and array of all items associated with a merchant' do
        merchant = Merchant.create(name: 'Shopin1901')
        item1 = Item.create(name: 't-shirt', description: 'you can wear it if you want', unit_price: 1000, img: './default-photo.png', merchant_id: 1)
        item2 = Item.create(name: 'another item', description: 'you can wear it if you want', unit_price: 1000, img: './default-photo.png', merchant_id: 1)
        item3 = Item.create(name: 'wait, no, another item', description: 'you can wear it if you want', unit_price: 1000, img: './default-photo.png', merchant_id: 1)

        expect(Merchant.find(1).items).to eq([item1, item2, item3])
      end
    end
    describe 'most_items' do
      it 'should return the merchant with the most items' do
        merchant_1 = Merchant.create(name: "hello")
        merchant_2 = Merchant.create(name: "jabba")
        merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
        merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
        merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
        merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
        merchant_2.items.create(name: "fool", description: "bar", unit_price: 40, img: "jkf")
        merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")
      
        expect(Merchant.most_items).to eq(1)
      end
    end
    describe 'highest priced item' do
      it 'should return the merchant with the mighest priced item' do
        merchant_1 = Merchant.create(name: "hello")
        merchant_2 = Merchant.create(name: "jabba")
        merchant_1.items.create(name: "foo", description: "bar", unit_price: 15, img: "jkf")
        merchant_1.items.create(name: "baz", description: "bar", unit_price: 15, img: "jkf")
        merchant_1.items.create(name: "cah", description: "bar", unit_price: 20, img: "jkf")
        merchant_1.items.create(name: "asdf", description: "bar", unit_price: 20, img: "jkf")
        merchant_2.items.create(name: "fool", description: "bar", unit_price: 40, img: "jkf")
        merchant_2.items.create(name: "biz", description: "bar", unit_price: 50, img: "jkf")

        expect(Merchant.highest_priced_item).to eq(2)
      end
    end
  end
end
