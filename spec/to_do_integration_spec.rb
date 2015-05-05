require 'capybara/rspec'
require './app'
require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows the user to create a new list') do
    visit('/')
    fill_in('list_to_be_added', :with => 'chores')
    find(:name, 'add_new_list').click()
    expect(page).to have_content('chores')
  end
end

describe('adding tasks to a list', {:type => :feature}) do
  it('allows the user to create tasks within specific lists') do
    visit('/')
    fill_in('list_to_be_added', :with => 'chores')
    find(:name, 'add_new_list').click()
    click_link('chores')
    fill_in('task_to_be_added', :with => 'do the dishes')
    find(:name, 'add_new_task').click()
    expect(page).to have_content('do the dishes')
  end
end
