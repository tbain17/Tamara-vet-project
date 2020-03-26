require_relative("../models/owner")
require_relative("../models/vet")
require_relative("../models/pet")
require_relative("../models/room")
require_relative("../models/treatment")
require_relative("../models/appointment")
require("pry-byebug")

Pet.delete_all()
Owner.delete_all()
Vet.delete_all()
Room.delete_all()
Treatment.delete_all()

vet1 = Vet.new (
  {
    'first_name' => 'Benedict',
    'last_name' => 'Sondheim',
    'specialty' => 'small animals'
  }
)
vet2 = Vet.new (
  {
    'first_name' => 'Gertrude',
    'last_name' => 'Lemons',
    'specialty' => 'surgery'
  }
)
vet3 = Vet.new (
  {
    'first_name' => 'Alexandria',
    'last_name' => 'Jenkins',
    'specialty' => 'critial care'
  }
)

vet1.save()
vet2.save()
vet3.save()

owner1 = Owner.new(
  {
    'first_name' => 'Richard',
    'last_name' => 'Sanders',
    'phone_number' => '01234 567890',
    'email' => 'R.Sand@email.com'
  }
)
owner2 = Owner.new(
  {
    'first_name' => 'Leslie',
    'last_name' => 'Hamilton',
    'phone_number' => '01234 555909',
    'email' => 'leshami@here.co.uk'
  }
)
owner3 = Owner.new(
  {
    'first_name' => 'Laura',
    'last_name' => 'Lumpkin',
    'phone_number' => '01234 234013',
    'email' => 'Lauralumpkin1337@email.com'
  }
)

owner1.save()
owner2.save()
owner3.save()

room1 = Room.new(
  {
    'name' => 'Room 1'
  }
)

room2 = Room.new(
  {
    'name' => 'Room 2'
  }
)
room2.save()
room1.save()

treatment1 = Treatment.new(
  {
    'type' => 'surgery'
  }
)

treatment2 = Treatment.new(
  {
    'type' => 'claw trim'
  }
)
treatment3 = Treatment.new(
  {
    'type' => 'teeth clean'
  }
)
treatment4 = Treatment.new(
  {
    'type' => 'vaccinations'
  }
)
treatment1.save()
treatment2.save()
treatment3.save()
treatment4.save()

pet1 = Pet.new(
  {
    'name' => 'Alexios',
    'dob' => '01/06/2006',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => 'iguana',
    'notes' => 'Loves to eat bugs'
  }
)

pet2 = Pet.new(
  {
    'name' => 'Nemo',
    'dob' => '13/09/2019',
    'vet_id' => vet2.id,
    'owner_id' => owner3.id,
    'type' => 'clown fish',
    'notes' => 'Gets lost sometimes'
  }
)

pet3 = Pet.new(
  {
    'name' => 'Stanley',
    'dob' => '02/02/2017',
    'vet_id' => vet2.id,
    'owner_id' => owner1.id,
    'type' => 'guinea pig',
    'notes' => 'Bites'
  }
)

pet4 = Pet.new(
  {
    'name' => 'Humphrey',
    'dob' => '17/05/2011',
    'vet_id' => vet3.id,
    'owner_id' => owner2.id,
    'type' => 'dog',
    'notes' => 'Loves tummy rubs'
  }
)

pet5 = Pet.new(
  {
    'name' => 'Purrdita',
    'dob' => '19/01/2018',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => 'cat',
    'notes' => 'Hates other animals'
  }
)

pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()

appointment1 = Appointment.new(
  {
    'pet_id' => pet1.id,
    'room_id' => room2.id,
    'treatment_id' => treatment2.id,
    'time' => "1230"
  }
)
appointment2 = Appointment.new(
  {
    'pet_id' => pet3.id,
    'room_id' => room1.id,
    'treatment_id' => treatment1.id,
    'time' => "1430"
  }
)
appointment1.save()
appointment2.save()
