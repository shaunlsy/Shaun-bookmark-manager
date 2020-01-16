# frozen_string_literal: true

require_relative '../../lib/bookmarks.rb'

describe Bookmarks do


  describe '#all' do
    it 'shows all bookmarks' do
      bookmark = Bookmarks.create(url: 'http://www.makersacademy.com', title: 'makersacademy')
      Bookmarks.create(url: 'http://www.twitter.com', title: 'twitter')
      Bookmarks.create(url: 'http://www.google.com', title: 'google')

      bookmarks = Bookmarks.all

      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      expect(bookmarks.first.title).to eq 'makersacademy'
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks[2].url).to eq 'http://www.google.com'
      expect(bookmarks[2].title).to eq 'google'
      expect(bookmarks[1].url).to eq 'http://www.twitter.com'
      expect(bookmarks[1].title).to eq 'twitter'
    end
  end

  describe '#create' do
    it 'add a url to the database' do
      bookmark = Bookmarks.create(url: 'http://test-url.com', title: 'test-url')
      expect(bookmark.url).to eq 'http://test-url.com'
      expect(bookmark.title).to eq 'test-url'
    end
  end
end
