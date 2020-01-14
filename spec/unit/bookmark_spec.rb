require_relative '../../lib/bookmarks.rb'

describe Bookmarks do

  describe '#all' do
    it 'shows all bookmarks' do
      database = PG.connect( dbname: 'bookmark_manager_test' )

      database.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      database.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
      database.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      expect(subject.all).to include 'http://www.makersacademy.com'
      expect(subject.all).to include 'http://www.google.com'
      expect(subject.all).to include 'http://www.twitter.com'
    end
  end
end
