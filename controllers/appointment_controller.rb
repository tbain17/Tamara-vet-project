require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/pet')
require_relative('../models/room')
require_relative('../models/appointment')
require_relative('../models/treatment')
also_reload('../models/*')

get '/appointments' do
  @appointments = Appointment.all()
  erb (:"appointments/index")
end

get '/appointments/new' do
  @pets = Pet.all()
  @rooms = Room.all()
  @treatments = Treatment.all()
  erb(:"appointments/new")
end

post '/appointments' do
  Appointment.new(params).save
  redirect to ('/appointments')
end

get '/appointments/:id' do
  @appointment = Appointment.find(params[:id].to_i())
  erb (:"appointments/show")
end

get '/appointments/:id/edit' do
  @pets = Pet.all()
  @rooms = Room.all()
  @treatments = Treatment.all()
  @appointment = Appointment.find(params[:id].to_i())
  erb(:"appointments/edit")
end

post '/appointments/:id' do
  Appointment.new(params).update()
  redirect to ('/appointments')
end

post '/appointments/:id/delete' do
  Appointment.delete(params[:id].to_i())
  redirect to('/appointments')
end
