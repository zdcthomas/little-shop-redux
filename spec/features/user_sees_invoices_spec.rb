RSpec.describe 'a user enters /invoices' do
  describe 'a user visits /invoices' do
    describe 'they see an index labled Index' do
      visit '/invoices'
      within '#h1' do
        expect(page).to have_content("Invoices")
      end
    end

    describe 'they see a index of all invoices' do
      Invoice.new(id: 1, merchant_id: 12335938, customer_id: 1, status: 'pending')
      Invoice.new(id: 3, merchant_id: 14839458, customer_id: 2, status: 'confirmed')
      visit '/invoices'
      within '#invoices' do
        expect(page).to have_content('pending')
        expect(page).to have_content('confirmed')
        expect(page).to have_content('14839458')
      end
    end

  end
end