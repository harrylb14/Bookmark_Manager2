feature 'adding bookmarks' do
  scenario 'there is a form for adding bookmarks' do
    visit '/bookmarks'
    expect(page).to have_field "New_bookmark"
  end

  scenario 'submitting a new bookmark takes you back to the bookmarks page' do
    visit '/bookmarks'
    click_button 'Submit new bookmark'
    expect(page).to have_content 'Your bookmarks:'
  end

  scenario 'submitting new bookmark adds new bookmark to database' do
    visit '/bookmarks'
    fill_in 'New_bookmark', with: 'www.woolworths.com'
    click_button 'Submit new bookmark'
    expect(page).to have_content 'www.woolworths.com'
  end
end
