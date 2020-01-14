# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  before do
    @database = Bookmarks.instance
    @bookmark = Bookmarks
  end

  get '/' do
    'Bookmark List'
  end

  get '/bookmarks' do
    erb :bookmark
  end

  post '/add-url' do
    p params
    @bookmark.add_bookmark(params[:bookmark])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
