require 'rspec'
require 'task'
require 'pg'
require 'list'

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
