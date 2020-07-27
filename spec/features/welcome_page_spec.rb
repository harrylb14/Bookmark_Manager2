feature 'is a welcome page' do
  scenario 'greets user' do
    visit('/')
    expect(page).to have_content('Welcome user!')
  end
end