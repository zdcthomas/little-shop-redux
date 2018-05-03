RSpec.describe 'user visits merchant index page' do
  it 'should see a list of merchants' do
    merchant_name = Merchant.create(name: "Merchant 1")

    visit('/merchants')

    expect(page).to have_content(merchant_name)
  end
end
