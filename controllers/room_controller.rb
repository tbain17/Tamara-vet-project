require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/vet')
require_relative('../models/pet')
require_relative('../models/room')
also_reload('../models/*')

get '/rooms' do
  @rooms = Room.all()
  erb (:"rooms/index")
end
