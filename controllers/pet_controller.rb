require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/vet')
require_relative('../models/pet')
also_reload('../models/*')

get '/pets' do
  @pets = Pets.all()
  erb (:"pets/index")
end
