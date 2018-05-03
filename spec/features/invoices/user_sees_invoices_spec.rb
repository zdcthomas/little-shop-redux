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

      expect(page).to have_content('Status: pending')
      expect(page).to have_content('Merchant Id: 12335938')
      expect(page).to have_content('Customer Id: 1')

    end

    it 'should display no such invoice if invoice doesnt exist' do
      visit '/invoices/1'
      expect(page.status_code).to eq(404)
    end
  end

  describe 'tries to edit an invoice status' do
    Invoice.create(id: 1, merchant_id: 12335938, customer_id: 1, status: 'pending')

    visit '/invoices/1/edit'
    fill_in 'status', with:'Confirmed'
    click_button 'submit'

    current_path.should eq.('invoices/1')
    expect(page).to_not have_content('Status: pending')
    expect(page).to have_content('Status: Confirmed')
  end

end
