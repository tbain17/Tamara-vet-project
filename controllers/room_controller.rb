require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/room')
also_reload('../models/*')

get '/rooms' do
  @rooms = Room.all()
  erb (:"rooms/index")
end

get '/rooms/new' do
  erb(:"rooms/new")
end

post '/rooms' do
  Room.new(params).save()
  redirect to('/rooms')
end

get '/rooms/:id' do
  @room = Room.find(params[:id].to_i())
  erb (:"rooms/show")
end

get '/rooms/:id/edit' do
  @room = Room.find(params[:id].to_i())
  erb(:"rooms/edit")
end

post '/rooms/:id' do
  Room.new(params).update()
  redirect to ('/rooms')
end

post '/rooms/:id/delete' do
  Room.delete(params[:id].to_i())
  redirect to('/rooms')
end
