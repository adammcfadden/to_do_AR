require 'rspec'
require 'task'
require 'pg'
require 'list'
require 'capybara'

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end

Capybara.add_selector(:name) do
  xpath { |name| XPath.descendant[XPath.attr(:name).contains(name)] }
end
