feature 'Bookmark list' do
  scenario 'shows bookmark list' do
    visit '/bookmarks'
    expect(page).to have_content('Netflix BBC')
  end
end
