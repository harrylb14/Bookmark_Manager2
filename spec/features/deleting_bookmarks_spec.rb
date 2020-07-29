feature 'deleting bookmarks' do
  scenario 'we want to delete bookmarks' do
    visit('/bookmarks')
    expect(page).to have_field 'Deleted_title'
    expect(page).to have_button 'Delete Bookmark'
  end
  scenario 'it takes us back to the bookmark list' do
    input_woolworths
    fill_in 'Deleted_title', with: 'Woolworths'
    click_button 'Delete Bookmark'
    expect(page).to_not have_content 'Woolworths'
  end
end
