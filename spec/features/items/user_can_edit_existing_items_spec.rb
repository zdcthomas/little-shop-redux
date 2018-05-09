RSpec.describe 'Visitors' do
  it 'should save changed item info' do
    item1_name = 'Sticker'
    item1_description = 'You can use this to decorate your laptop'
    item1_price = 7
    item1_image = '/images/default-photo.png'
    item1 = Item.create(name: item1_name, description: item1_description, unit_price: item1_price, img: item1_image)
    visit('/items/1/edit')

    fill_in('item[name]', :with=> 'thing')
    fill_in('item[description]', :with=> 'information')
    fill_in('item[unit_price]', :with=> 6)
    fill_in('item[img]', :with=> 'http://www.suttonsilver.co.uk/wp-content/uploads/blog-stock-02.jpg')
    
    click_button('Submit')
    expect(page.current_path).to eq('/items')
    expect(page).to have_content('thing')
  end
end
