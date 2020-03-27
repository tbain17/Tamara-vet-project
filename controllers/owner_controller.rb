require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  Owner.new(params).save
  erb(:"owners/created")
end

get '/owners/:id' do
  @owner = Owner.find(params[:id].to_i())
  erb (:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id].to_i())
  erb(:"owners/edit")
end

post '/owners/:id' do
  Owner.new(params).update()
  redirect to ('/owners')
end

post '/owners/:id/delete' do
  Owner.delete(params[:id].to_i())
  redirect to('/owners')
end

post '/owners/:id/unregister' do
  Owner.new(params).unregister()
  redirect to('/owners')
end

post '/owners/:id/reregister' do
  Owner.new(params).reregister()
  redirect to('/owners')
end
