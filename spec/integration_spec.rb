require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new stylist', {:type => :feature}) do
  it('allows user to add a stylist and view page') do
    visit('/')
    fill_in('stylist_name', :with => 'Wacky Wanda')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link('Return to Homepage')
    click_link('Wacky Wanda')
    expect(page).to have_content('Information for Wacky Wanda')
  end
end
