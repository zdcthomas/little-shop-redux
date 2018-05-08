RSpec.describe Item do

  describe 'validations' do
    describe 'valid context' do
      it 'should be valid with a title, description, price, and image' do
      item = Item.create(title: 't-shirt', description: 'you can wear it if you want', unit_price: 10.00, img: './default-photo.png')

      expect(item).to be_valid
    end
  end

    describe 'invalid context' do
      it 'should be invalid if missing a unique title' do
        item = Item.create(description: 'what item?', unit_price: 0.00, img: './default-photo.png')

        expect(item).to_not be_valid
      end
    end

      it 'should be invalid if missing description' do
        item = Item.create(title: 'empty box', unit_price: 1.00, img: './default-photo.png')

        expect(item).to_not be_valid
  end

      it 'should be invalid if missing price' do
        item = Item.create(title: 'Expensive necklace', description: 'not free', img: './default-photo.png')

        expect(item).to_not be_valid
      end
  end

      it 'should be invalid if missing image' do
        item = Item.create(title: 'Really cool item', description: 'if only you could see it', unit_price: 9.00)

        expect(item).to_not be_valid
      end
  end
