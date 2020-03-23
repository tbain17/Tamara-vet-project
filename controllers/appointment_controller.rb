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

get '/appointments' do
  @appointments = Appointment.all()
  erb (:"appointments/index")
end
