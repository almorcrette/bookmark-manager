require_relative '../../app.rb'

feature 'Viewing Bookmarks' do

  scenario 'User can see all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create('http://www.makersacademy.com')
    Bookmark.create('http://www.destroyallsoftware.com')
    Bookmark.create('http://www.google.com')

    visit '/bookmarks'
    
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end