RSpec.describe 'Visitors' do

  it 'should redirect to selected item show page' do
    click_link('item')
    expect(page).to have_content('//views/show')
  end
end
