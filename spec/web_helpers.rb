def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end

def input_woolworths
  visit('/bookmarks')
  fill_in 'New_url', with: 'https://www.woolworths.com.au'
  fill_in 'New_title', with: 'Woolworths'
  click_button 'Submit new bookmark'
end
