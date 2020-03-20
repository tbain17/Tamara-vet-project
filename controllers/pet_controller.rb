require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/vet')
require_relative('../models/pet')
also_reload('../models/*')

get '/pets' do
  @pets = Pet.all()
  erb (:"pets/index")
end

get '/pets/new' do
  @vets = Vet.all()
  @owners = Owner.all()
  erb(:"pets/new")
end
