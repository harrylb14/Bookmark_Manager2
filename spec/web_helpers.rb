def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end

def input_woolworths
  visit('/bookmarks')
  fill_in 'New_url', with: 'https://www.woolworths.com.au'
  fill_in 'New_title', with: 'Woolworths'
  click_button 'Submit new bookmark'
end
