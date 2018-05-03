RSpec.describe 'A User' do
  describe 'visits /invoices' do
    it 'should display an index labled Index' do
      visit '/invoices'
      expect(page).to have_content("Invoices")
    end

    it 'display an index of all invoices' do
      Invoice.create(id: 1, merchant_id: 12335938, customer_id: 1, status: 'pending')
      Invoice.create(id: 3, merchant_id: 14839458, customer_id: 2, status: 'confirmed')
      visit '/invoices'
      expect(page).to have_content('pending')
      expect(page).to have_content('confirmed')
      expect(page).to have_content('14839458')
    end

  end
end