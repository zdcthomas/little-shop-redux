RSpec.describe 'Visitors' do

  it 'should save changed item info' do
    item1_title = 'Sticker'
    item1_description = 'You can use this to decorate your laptop'
    item1_price = 7
    item1_image = '/images/default-photo.png'
    item1 = Item.create(title: item1_title, description: item1_description, unit_price: item1_price, img: item1_image)
    item1.save
    visit('/items/1')

    click_button('delete')
    visit('/items')
    expect(page).to_not have_content('Sticker')
  end
end
