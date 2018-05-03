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

  describe 'visits a specific invoice' do
    it 'should display a certain invoice if that invoice exists' do
      Invoice.create(id: 1, merchant_id: 12335938, customer_id: 1, status: 'pending')
      visit '/invoices/1'
      expect(page).to_not have_content('No Such Invoice')
      expect(page).to have_content('pending')
      expect(page).to have_content('12335938')
    end

    it 'should display no such invoice if invoice doesnt exist' do
      visit '/invoices/1'
      expect(page).to have_content('No Such Invoice')
    end
  end
end
