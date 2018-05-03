RSpec.describe 'Visitors' do

  it 'should redirect to selected item show page' do
    click_link('item')
    page.has_xpath?('//views/show')
  end
end
