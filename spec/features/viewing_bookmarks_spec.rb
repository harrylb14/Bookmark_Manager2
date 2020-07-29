feature 'shows bookmarks' do
  scenario 'it has a heading' do
    visit('/bookmarks')
    expect(page).to have_content('Your bookmarks:')
  end

  scenario 'user wants to see bookmarks' do
    PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.add(url: 'http://www.google.com', title: 'Google')
    Bookmark.add(url: 'http://www.facebook.com', title: 'Faceyb')

    visit('/bookmarks')
    
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Faceyb', href: 'http://www.facebook.com')
  end
end
