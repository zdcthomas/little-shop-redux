Rspec.describe 'validations' do
  describe 'required fields' do
    it 'should be invalid if there is no name' do
      merchant = Merchant.create(id: 1234567, created_at: '2010-12-10')

      expect(merchant).to_not be_valid
    end
  end
end
