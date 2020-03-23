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

get '/vets' do
  @vets = Vet.all()
  erb (:"vets/index")
end

get '/vets/new' do
  erb(:"vets/new")
end

post '/vets' do
  Vet.new(params).save()
  redirect to ('/vets')
end

get '/vets/:id' do
  @vet = Vet.find(params[:id].to_i())
  erb (:"vets/show")
end

get '/vets/:id/edit' do
  @vet = Vet.find(params[:id].to_i())
  erb(:"vets/edit")
end

post '/vets/:id' do
  Vet.new(params).update()
  redirect to ('/vets')
end

post '/vets/:id/delete' do
  Vet.delete(params[:id].to_i())
  redirect to('/vets')
end
