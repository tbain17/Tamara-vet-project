require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/owner')
require_relative('../models/vet')
require_relative('../models/pet')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  Owner.new(params).save
  erb(:"owners/created")
end

get '/owners/:id' do
  @owner = Owner.find(params[:id].to_i())
  erb (:show)
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id].to_i())
  erb(:"owners/edit")
end

post '/owners/:id' do
  Owner.new(params).update()
  redirect to ('/owners')
end
