feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.add(url: 'http://www.woolworths.com', title: 'Woolworths')
    visit '/bookmarks'
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "http://www.ripwoolworths.com")
    fill_in('title', with: "RIP Woolworths")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Woolworths', href: 'http://www.woolworths.com')
    expect(page).to have_link('RIP Woolworths', href: 'http://www.ripwoolworths.com')
  end
end
