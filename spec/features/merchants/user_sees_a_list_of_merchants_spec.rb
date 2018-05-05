RSpec.describe 'user visits merchant index page' do
  it 'should see a list of merchants' do
    merchant = Merchant.create(name: 'Merchant 1')

    visit('/merchants')

    expect(page).to have_content(merchant.name)
  end

  it 'should see no merchants when there are none' do
    Merchant.create()
    visit('/merchants')

    expect(page).to have_content('')
  end

  it 'should go to /edit when edit is clicked' do
    Merchant.create(name: 'Test Merch')

    visit('/merchants')
    click_on('Edit')

    expect(current_path).to eq('/merchants/1/edit')
  end

  it 'should delete a record when _Delete_ is pressed' do
    Merchant.create(name: 'Foo')

    visit('/merchants')
    click_button('Delete')

    expect(page).to have_content('')
  end
end
