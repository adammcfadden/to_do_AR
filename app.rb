require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/list'
require './lib/task'
require 'pg'
also_reload './lib/**/*.rb'

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

get('/list/:list_name/:list_id') do
  @list_name = params.fetch('list_name').capitalize()
  @list_id = params.fetch('list_id')
  @tasks = Task.task_where(@list_id)
  erb(:list)
end

get('/:list_name/:list_id') do
  @list_name = params.fetch('list_name').capitalize()
  @list_id = params.fetch('list_id')
  @tasks = Task.task_where(@list_id)
  erb(:list)
end

post('/list/:list_name/:list_id/new_task') do
  @list_name = params.fetch('list_name').capitalize()
  @list_id = params.fetch('list_id')
  unless params.fetch('task_to_be_added') == ''
    task = params.fetch('task_to_be_added')
    new_task = Task.new({:description => task, :list_id => @list_id})
    new_task.save()
    @tasks = Task.task_where(@list_id)
    erb(:list)
  else
    @tasks = Task.task_where(@list_id)
    erb(:list)
  end
end

post('/:list_name/:list_id/new_task') do
  @list_name = params.fetch('list_name').capitalize()
  @list_id = params.fetch('list_id')
  unless params.fetch('task_to_be_added') == ''
    task = params.fetch('task_to_be_added')
    new_task = Task.new({:description => task, :list_id => @list_id})
    new_task.save()
    @tasks = Task.task_where(@list_id)
    erb(:list)
  else
    @tasks = Task.task_where(@list_id)
    erb(:list)
  end
end
