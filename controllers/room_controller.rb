require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/vet')
require_relative('../models/pet')
require_relative('../models/room')
require_relative('../models/appointment')
require_relative('../models/treatment')
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
