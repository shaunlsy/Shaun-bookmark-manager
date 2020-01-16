# frozen_string_literal: true

require 'pg'

class Bookmarks

  attr_reader :url, :title, :id

  def initialize(url:, title:, id:)
    @url = url
    @title = title
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end

    database.exec('SELECT * FROM bookmarks').map do |row|
      Bookmarks.new(url: row['url'], title: row['title'], id: row['id'])
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end

    result = database.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end

    result = database.exec("SELECT * FROM bookmarks WHERE id = '#{id}'")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url']).id
  end

  def self.update(url:, title:, id:)
    if ENV['ENVIRONMENT'] == 'test'
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    result = database.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id = '#{id}' RETURNING id, url, title")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

end
