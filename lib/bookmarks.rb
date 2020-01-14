require 'pg'

class Bookmarks

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @database = PG.connect(dbname: 'bookmark_manager_test')
    else
      @database = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def all
    @database.exec("SELECT * FROM bookmarks").map do |row|
      row['url']
    end
  end
end
