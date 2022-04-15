require_relative '../../app.rb'

feature 'Adding a new Bookmark' do
  scenario 'A user can add a new bookmark' do
    visit '/bookmarks/new'
    fill_in('URL', with: 'https://www.bbc.co.uk/sounds')
    fill_in('title', with: 'BBC Sounds')
    click_button 'Submit'
    expect(page).to have_link('BBC Sounds', href: 'https://www.bbc.co.uk/sounds') 
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end