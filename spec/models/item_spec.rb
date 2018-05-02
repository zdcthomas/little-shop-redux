Rspec.describe Item do

  describe 'validations' do
    describe 'valid context' do
      it 'should be valid with a title, description, and price'
      item = Item.create(title: 't-shirt', description: 'you can wear it if you want', price: 10.00)

      expect(item).to be_valid
    end

    describe 'invalid context' do
      it 'should be invalid if missing a unique title'
        item = Item.create(description: 'what item?', price: 0.00)

        expect(item).to_not be_valid
    end

      it 'should be invalid if missing description' do
        item = Item.create(title: 'empty box', price: 1.00)

        expect(item).to_not be_valid
  end

      it 'should be invalid if missing price' do
        item = Item.create(title: 'Expensive necklace', description: 'not free')

        expect(item).to_not be_valid
      end
end
