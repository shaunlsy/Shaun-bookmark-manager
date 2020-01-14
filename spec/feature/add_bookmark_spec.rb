feature 'add bookmark' do
  scenario 'user type in a url to save' do
    visit '/bookmarks'
    fill_in 'bookmark', with: 'http://www.mock.com'
    click_button 'Submit'
    expect(page).to have_content 'http://www.mock.com'
  end
end