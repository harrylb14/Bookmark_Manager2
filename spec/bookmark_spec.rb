require 'bookmark'
describe Bookmark do
  describe '.all' do
    it 'shows a list of bookmarks' do
      PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add(url: 'http://www.google.com', title: "Google")
      
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 1
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
    end
  end
  describe '.add' do
    it 'adds new bookmark url to the database' do
      bookmark = Bookmark.add(url: 'www.woolworths.com', title: "Woolworths")
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Woolworths'
      expect(bookmark.url).to eq 'www.woolworths.com'
    end
  end
  describe '.delete' do
    it 'deletes the bookmark from the database' do 
      Bookmark.add(url: 'www.woolworths.com', title: "Woolworths")
      Bookmark.delete("Woolworths")
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 0
    end
  end
end
