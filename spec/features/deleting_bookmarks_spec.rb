feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.add(url: 'https://www.woolworths.com.au', title: 'Woolworths')
    visit('/bookmarks')
    expect(page).to have_link('Woolworths', href: 'https://www.woolworths.com.au')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Woolworths', href: 'https://www.woolworths.com.au')
  end
end
