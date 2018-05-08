RSpec.describe 'user goes to the merchant edit page' do
  it 'should have a blank form to edit merchant name'
    merchant = Merchant.create(name: 'Littleshopofhorrors')

    visit('/merchants')
    click_on('Edit')

    expect(current_path).to eq('/merchants/1/edit')


end
