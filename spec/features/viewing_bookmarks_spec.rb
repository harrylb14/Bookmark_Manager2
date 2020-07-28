feature 'shows bookmarks' do
  scenario 'user wants to see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('Your bookmarks:')
  end
  scenario 'user wants to see what the bookmarks are' do
    visit('/bookmarks')
    expect(page).to have_content('Facebook')
  end
end
