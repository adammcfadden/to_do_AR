require 'sinatra'
require 'sinatra/reloader'
require './lib/list'
require './lib/task'
require 'pg'
also_reload './lib/**/*.rb'

DB = PG.connect({:dbname => 'to_do'})

get('/') do
  @lists = List.all()
  erb(:index)
end
