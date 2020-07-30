require 'sinatra/base'
require './lib/bookmark'
require './lib/comment'
require './database_connection_setup' 
require 'sinatra/flash'
require 'uri'


class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash
  
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.add(url: params[:New_url], title: params[:New_title])
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.add(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
