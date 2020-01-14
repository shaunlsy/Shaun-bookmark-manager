# frozen_string_literal: true

require 'pg'

class Bookmarks
  def self.instance
    @database ||= create
  end

  def self.all
    @database.exec('SELECT * FROM bookmarks').map do |row|
      row['url']
    end
  end

  def self.add_bookmark(url)
    @database.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
  end

  private

  def self.create
    @database = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect(dbname: 'bookmark_manager_test')
                else
                  PG.connect(dbname: 'bookmark_manager')
                end
  end
end
