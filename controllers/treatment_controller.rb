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
