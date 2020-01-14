require 'pg'

def setup_test_database
  p 'Setting up database'

  database = PG.connect( dbname: 'bookmark_manager_test' )

  database.exec("TRUNCATE bookmarks;")
end
