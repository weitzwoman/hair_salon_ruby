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

describe('delete stylist', {:type => :feature}) do
  it('allows user to delete stylist name from database') do
    stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
    stylist.save()
    visit("/stylist/#{stylist.id()}")
    click_button('Delete Stylist from Database')
    expect(page).to have_content('Admin Only')
  end
end

describe('add client to stylist list', {:type => :feature}) do
  it('allows user to add a client to individual stylist') do
    stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
    stylist.save()
    visit("/stylist/#{stylist.id()}")
    fill_in('client_name', :with => 'Weirdo Walter')
    click_button('Add Client')
    click_link('Return to Homepage')
    click_link('Wacky Wanda')
    expect(page).to have_content('Weirdo Walter')
  end
end

describe('change client name', {:type => :feature}) do
  it('allows user to change client name') do
    stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
    stylist.save()
    client = Client.new({:name => 'Weirdo Walter', :id => nil, :stylist_id => "#{stylist.id()}"})
    client.save()
    visit("/client/#{client.id()}")
    fill_in("new_name", :with => 'Nicer Nate')
    click_button('Update Name')
    expect(page).to have_content('Nicer Nate')
  end
end
