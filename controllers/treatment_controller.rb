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

get '/treatments' do
  @treatments = Treatment.all()
  erb (:"treatments/index")
end

get '/treatments/new' do
  erb(:"treatments/new")
end

post '/treatments' do
  Treatment.new(params).save()
  redirect to('/treatments')
end

get '/treatments/:id' do
  @treatment = Treatment.find(params[:id].to_i())
  erb (:"treatments/show")
end

get '/treatments/:id/edit' do
  @treatment = Treatment.find(params[:id].to_i())
  erb(:"treatments/edit")
end

post '/treatments/:id' do
  Treatment.new(params).update()
  redirect to ('/treatments')
end

post '/treatments/:id/delete' do
  Treatment.delete(params[:id].to_i())
  redirect to('/treatments')
end
