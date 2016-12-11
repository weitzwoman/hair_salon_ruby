require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new stylist', {:type => :feature}) do
  it('allows user to add a stylist and view page') do
    visit('/')
    fill_in('stylist_name', :with => 'Wacky Wanda')
    click_button('Add Stylist')
    click_link('Return to Homepage')
    click_link('Wacky Wanda')
    expect(page).to have_content('Information for Wacky Wanda')
  end
end

describe('change stylist name', {:type => :feature}) do
  it('allows user to change stylist name') do
    stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
    stylist.save()
    visit("/stylist/#{stylist.id()}")
    fill_in("new_name", :with => 'Moby Dick')
    click_button('Update Name')
    expect(page).to have_content('Moby Dick')
  end
end
