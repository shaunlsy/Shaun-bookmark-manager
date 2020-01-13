require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

 get '/' do
   'Bookmark List'
 end

 get '/bookmarks' do
    @bookmark = Bookmarks.new
    p @bookmark
    erb :bookmark
 end



 run! if app_file == $0
end
