# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark List'
  end

  get '/bookmarks' do
    @bookmark = Bookmarks.new
    erb :bookmark
  end

  run! if app_file == $PROGRAM_NAME
end
