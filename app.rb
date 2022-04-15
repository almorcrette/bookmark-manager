require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'
require './database_connection_setup'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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

  # Bookmarks new
  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  enable :sessions, :method_override

  # Bookmarks create
  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/
      p "I've passed the validation rule"
      Bookmark.create(url: params[:url], title: params[:title])
    else
      p "I've been caught by the validation rule"
      flash[:notice] = "You must submit a valid URL."
      p flash[:notice]
    end
    redirect to('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    p "is it getting here?"
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end