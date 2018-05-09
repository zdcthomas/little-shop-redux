RSpec.describe 'user visits merchant index page' do
  it 'displays a list of merchants' do
    merchant = Merchant.create(name: 'Merchant 1')

    visit('/merchants')

    expect(page).to have_content(merchant.name)
  end

  it 'displays no merchants when there are none' do
    Merchant.create()
    visit('/merchants')

    expect(page).to have_content('')
  end

  it 'goes to /edit when edit is clicked' do
    Merchant.create(id: 1, name: 'Test Merch')

    visit('/merchants')
    
    click_link('edit_button_1')
    sleep(1)
    expect(current_path).to eq('/merchants/1/edit')
  end

  it 'deletes a record when _Delete_ is clicked' do
    Merchant.create(name: 'Foo')

    visit('/merchants')
    click_button('Delete')
    expect(page).to have_content('')
  end
end
