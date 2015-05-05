require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The to_do path', {:type => :feature}) do
  it('allows the user to create a new list') do
    visit('/')
    click_button('add_new_list')
    fill_in('list_to_be_added', :with => 'House chores')
    click_button('submit_new_list')
    expect(page).to have_content('House chores')
  end
end
