require_relative '../../app.rb'

feature 'Viewing Bookmarks' do
  it 'displays bookmarks on /bookmarks page' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makers.academy.com'
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://excalidraw.com'
  end
end