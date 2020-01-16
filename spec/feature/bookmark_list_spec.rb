feature 'Bookmark list' do
  scenario 'shows bookmark list' do
    database = PG.connect( dbname: 'bookmark_manager_test' )

    database.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.makersacademy.com','makersacademy');")
    database.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.twitter.com','twitter');")
    database.exec("INSERT INTO bookmarks (url,title) VALUES('http://www.google.com','google');")

    visit '/bookmarks'
    expect(page).to have_link('google', href: "http://www.google.com")
  end
end
