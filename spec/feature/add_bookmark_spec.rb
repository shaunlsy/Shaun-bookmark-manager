feature 'add bookmark' do
  scenario 'user type in a url to save' do
    visit '/'
    fill_in 'bookmark', with: 'http://www.mock.com'
    fill_in 'title', with: 'mock'
    click_button 'Submit'
    expect(page).to have_link('mock', href: 'http://www.mock.com')
  end
end
