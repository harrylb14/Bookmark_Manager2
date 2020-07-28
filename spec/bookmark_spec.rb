require 'bookmark'
describe Bookmark do
  describe '.all' do
    it 'shows a list of bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add('http://www.google.com')
      expect(Bookmark.all).to include 'http://www.google.com'
    end
  end
  describe '.add' do
    it 'adds new bookmarks to the database' do
      PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add('www.woolworths.com')
      expect(Bookmark.all).to include 'www.woolworths.com'
    end
  end
end
