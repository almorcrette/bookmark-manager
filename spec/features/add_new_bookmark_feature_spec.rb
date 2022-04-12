require_relative '../../app.rb'

feature 'Adding a new Bookmark' do
  scenario 'A user can add a new bookmark' do
    visit '/bookmarks'
    click_button 'Add new'
    fill_in("URL", with: 'https://www.bbc.co.uk/sounds')
    click_on 'Add'
    expect(page).to have_content 'https://www.bbc.co.uk/sounds'
  end
end