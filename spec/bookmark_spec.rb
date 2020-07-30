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
      bookmark = Bookmark.add(title: 'Woolworths', url: 'www.woolworths.com')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.add(title: 'Woolworths', url: 'http://www.woolworths.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.ripwoolworths.com', title: 'RIP Woolworths')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'RIP Woolworths'
      expect(updated_bookmark.url).to eq 'http://www.ripwoolworths.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add(title: 'Woolworths', url: 'http://www.woolworths.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Woolworths'
      expect(result.url).to eq 'http://www.woolworths.com'
    end
  end
end
