require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect(:dbname => 'salon')

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/add_stylist') do
  name = params.fetch('stylist_name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

post('/stylist/:id') do
  name = params.fetch('client_name')
  stylist_id = params.fetch('stylist_id')
  client = Client.new({:name => name, :id => nil, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:success)
end

patch('/stylist/:id') do
  name = params.fetch('new_name')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

delete('/stylist/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

get('/client/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client)
end

patch('/client/:id') do
  name = params.fetch('new_name')
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:name => name})
  erb(:client)
end

delete('/client/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  @stylists = Stylist.all()
  erb(:index)
end
