require 'sinatra/base'

class BookmarkManager < Sinatra::Base

 get '/' do
   'Bookmark List'
 end

 run! if app_file == $0
end
