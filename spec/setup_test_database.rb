def wipe_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks, comments RESTART IDENTITY;")
end
