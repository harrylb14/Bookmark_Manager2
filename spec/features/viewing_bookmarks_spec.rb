feature 'shows bookmarks' do
  scenario 'user wants to see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('Your bookmarks:')
  end
end