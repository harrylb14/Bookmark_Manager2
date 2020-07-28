feature 'shows bookmarks' do
  scenario 'it has a heading' do
    visit('/bookmarks')
    expect(page).to have_content('Your bookmarks:')
  end

  scenario 'user wants to see bookmarks' do
    PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.add('http://www.google.com')
    Bookmark.add('http://www.facebook.com')

    visit('/bookmarks')
    
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.facebook.com')
  end
end
