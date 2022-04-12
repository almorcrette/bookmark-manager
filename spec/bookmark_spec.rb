require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include 'http://www.makers.academy.com'
      expect(bookmarks).to include 'http://google.com'
      expect(bookmarks).to include 'http://excalidraw.com'
    end
  end
end