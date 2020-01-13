require_relative '../../lib/bookmarks.rb'

describe Bookmarks do
  describe '#all' do
    it 'shows all bookmarks' do
      expect(subject.all).to eq 'Netflix BBC'
    end
  end
end
