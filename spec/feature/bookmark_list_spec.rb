feature 'Bookmark list' do
  scenario 'shows bookmark list' do
    database = PG.connect( dbname: 'bookmark_manager_test' )

    database.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    database.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
    database.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit '/bookmarks'
    expect(page).to have_content('http://www.google.com')
  end
end
