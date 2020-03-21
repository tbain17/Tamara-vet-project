require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/vet')
require_relative('../models/pet')
require_relative('../models/room')
require_relative('../models/treatment')
require_relative('../models/appointment')
also_reload('../models/*')

get '/rooms' do
  @rooms = Room.all()
  erb (:"rooms/index")
end
