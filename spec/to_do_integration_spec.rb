require 'capybara/rspec'
require './app'
require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The to_do path', {:type => :feature}) do
  it('allows the user to create a new list') do
    visit('/')
    fill_in('list_to_be_added', :with => 'chores')
    find(:name, 'add_new_list').click()
    expect(page).to have_content('chores')
  end
end
