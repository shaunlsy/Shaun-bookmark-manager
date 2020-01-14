require 'pg'

class Bookmarks

  def initialize
    @database = PG.connect(dbname: 'bookmark_manager')
  end

  def all
    @database.exec("SELECT * FROM bookmarks").map do |row|
      row['url']
    end
  end


end
