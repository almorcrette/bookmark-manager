require 'sinatra/base'
require 'sinatra/reloader'

require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello, world'
    
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    erb :'bookmarks/index'
  end

  # Bookmarks#create
  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect to('/bookmarks')
  end

  # Bookmarks#new
  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  

  run! if app_file == $0
end