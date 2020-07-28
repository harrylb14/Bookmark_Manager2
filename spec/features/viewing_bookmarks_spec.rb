feature 'shows bookmarks' do
  scenario 'it has a heading' do
    visit('/bookmarks')
    expect(page).to have_content('Your bookmarks:')
  end

  scenario 'user wants to see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks Values (1, 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks Values (2, 'http://www.facebook.com');")

    visit('/bookmarks')
    
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.facebook.com')
  end
end
