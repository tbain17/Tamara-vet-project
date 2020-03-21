require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/owner_controller')
require_relative('controllers/pet_controller')
require_relative('controllers/vet_controller')
require_relative('controllers/room_controller')
also_reload('./models/*')

get '/' do
  erb(:index)
end
