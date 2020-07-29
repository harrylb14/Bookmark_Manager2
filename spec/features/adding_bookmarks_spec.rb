feature 'adding bookmarks' do
  scenario 'there is a form for adding bookmarks url' do
    visit '/bookmarks'
    expect(page).to have_field "New_url"
  end

  scenario 'there is a form for adding bookmarks title' do
    visit '/bookmarks'
    expect(page).to have_field "New_title"
  end

  scenario 'submitting a new bookmark takes you back to the bookmarks page' do
    visit '/bookmarks'
    click_button 'Submit new bookmark'
    expect(page).to have_content 'Your bookmarks:'
  end

  scenario 'submitting new bookmark adds new bookmark to database' do
    input_woolworths
    expect(page).to have_link('Woolworths', href: 'www.woolworths.com')
  end
end
