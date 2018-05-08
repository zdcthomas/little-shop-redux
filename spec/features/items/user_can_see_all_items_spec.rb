RSpec.describe 'Visitors' do

  it 'should show visitors all items' do
    item1_name = 'Sticker'
    item1_description = 'You can use this to decorate your laptop'
    item1_price = 7
    item1_image = '/images/default-photo.png'
    item1 = Item.create(name: item1_name, description: item1_description, unit_price: item1_price, img: item1_image)
    item1.save
    item2_name = 'Water Bottle'
    item2_description = 'Stay Hydrated!'
    item2_price = 4
    item2_image = 'Users/jamisonordway/desktop/turing/2module/projects/little-shop-redux/images/default-photo.png'
    item2 = Item.create(name: item2_name, description: item2_description, unit_price: item2_price, img: item2_image)
    item2.save

    visit('/items')
    expect(page).to have_content(item1_description)
    expect(page).to have_content(item1_price)
    #expect(page).to have_content(item1_image)

    expect(page).to have_content(item2_name)
    expect(page).to have_content(item2_description)
    expect(page).to have_content(item2_price)
    #expect(page).to have_content(item2_image)
  end
end
