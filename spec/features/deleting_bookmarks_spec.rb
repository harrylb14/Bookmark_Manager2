feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.add(url: 'www.woolworths.com', title: 'Woolworths')
    visit('/bookmarks')
    expect(page).to have_link('Woolworths', href: 'www.woolworths.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Woolworths', href: 'www.woolworths.com')
  end
end
