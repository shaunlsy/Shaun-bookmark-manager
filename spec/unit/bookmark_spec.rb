# frozen_string_literal: true

require_relative '../../lib/bookmarks.rb'

describe Bookmarks do
  describe '#all' do
    it 'shows all bookmarks' do
      Bookmarks.add_bookmark('http://www.makersacademy.com')
      Bookmarks.add_bookmark('http://www.twitter.com')
      Bookmarks.add_bookmark('http://www.google.com')

      expect(Bookmarks.all).to include 'http://www.makersacademy.com'
      expect(Bookmarks.all).to include 'http://www.google.com'
      expect(Bookmarks.all).to include 'http://www.twitter.com'
    end
  end

  describe '#create' do
    it 'respond to create' do
      expect(Bookmarks).to receive(:create)
      Bookmarks.create
    end
  end

  describe '#add_bookmark' do
    it 'add a url to the database' do
      Bookmarks.add_bookmark('http://test-url.com')
      expect(Bookmarks.all).to include 'http://test-url.com'
    end
  end
end
