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
    erb :'bookmarks/index'
  end

  # Bookmarks create
  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect to('/bookmarks')
  end

  # Bookmarks new
  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    p params
    p [ params[:url], params[:title], params[:id] ]
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3",
      [ params[:url], params[:title], params[:id] ]
    )

    redirect '/bookmarks'
  end

  run! if app_file == $0
end