RSpec.describe 'Visitors' do

  it 'should redirect user to new item form' do
    visit('/items')
    click_link('new')
    expect(page).to have_content('New Item')
  end

  it 'should save new item information' do
    visit('/items/new')
    within 'form' do
      fill_in 'title', :with=> 'thing'
      fill_in 'description', :with=> 'information'
      fill_in 'unit_price', :with=> 6
      fill_in 'image', :with=> 'http://www.suttonsilver.co.uk/wp-content/uploads/blog-stock-02.jpg'
    end
    click_button('Submit')
    visit('/items')

    expect(page).to have_content('thing')
  end

  it 'should redirect user to index' do
    visit('/items/new')
    within 'form' do
      fill_in 'title', :with=> 'thing'
      fill_in 'description', :with=> 'information'
      fill_in 'unit_price', :with=> 6
      fill_in 'image', :with=> 'http://www.suttonsilver.co.uk/wp-content/uploads/blog-stock-02.jpg'
    end
    click_button('Submit')

end
end
