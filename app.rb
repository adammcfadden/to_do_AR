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

post('/list/new') do
  unless params.fetch('list_to_be_added') == ''
    list = params.fetch('list_to_be_added')
    new_list = List.new({:name => list, :id => nil})
    new_list.save()
    @lists = List.all()
    erb(:index)
  else
    @lists = List.all()
    erb(:index)
  end
end
