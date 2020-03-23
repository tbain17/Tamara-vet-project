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

get '/pets' do
  @pets = Pet.all()
  erb (:"pets/index")
end

get '/pets/new' do
  @vets = Vet.all()
  @owners = Owner.all()
  erb(:"pets/new")
end

post '/pets' do
  Pet.new(params).save()
  redirect to('/pets')
end

get '/pets/:id' do
  @pet = Pet.find(params[:id].to_i())
  erb (:"pets/show")
end

get '/pets/:id/edit' do
  @vets = Vet.all()
  @owners = Owner.all()
  @pet = Pet.find(params[:id].to_i())
  erb(:"pets/edit")
end

post '/pets/:id' do
  Pet.new(params).update()
  redirect to ('/pets')
end

post '/pets/:id/delete' do
  Pet.delete(params[:id].to_i())
  redirect to('/pets')
end
