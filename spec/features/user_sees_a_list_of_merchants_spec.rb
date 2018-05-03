RSpec.describe 'user visits merchant index page' do
  it 'should see a list of merchants' do
    merchant = Merchant.create(name: 'Merchant 1')

    visit('/merchants')

    expect(page).to have_content(merchant.name)
  end

  it 'should see no merchants when there are none' do
    merchant = Merchant.create()
    visit('/merchants')

    expect(page).to have_content('')
  end

  it 'should go to /edit when edit is clicked' do
    visit('/merchants')
    click_on('Edit')

    expect(current_path).to eq('/edit')
  end 
end
