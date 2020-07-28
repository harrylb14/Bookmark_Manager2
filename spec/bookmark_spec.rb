require 'bookmark'
describe Bookmark do
  describe '.all' do
    it 'shows a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks Values (1, 'http://www.google.com');")

      expect(Bookmark.all).to include "http://www.google.com"
    end
  end
end
