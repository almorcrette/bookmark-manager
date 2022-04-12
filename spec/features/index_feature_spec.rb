require_relative '../../app.rb'

feature 'Simple index page' do
  it 'displays a home page' do
    visit '/'
    expect(page).to have_content "Hello, world"
  end
end