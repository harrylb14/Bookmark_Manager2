require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.add(url: params[:New_url], title: params[:New_title])
    redirect '/bookmarks'
  end

  post '/delete' do
    Bookmark.delete(params[:Deleted_title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
