require_relative( "../models/owner" )
require_relative( "../models/vet" )
require_relative( "../models/pet" )
require("pry-byebug")

Pet.delete_all()
Owner.delete_all()
Vet.delete_all()

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
room1.save()

pet1 = Pet.new(
  {
    'name' => 'Alexios',
    'dob' => '01/06/2006',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => 'iguana',
    'notes' => ''
  }
)

pet2 = Pet.new(
  {
    'name' => 'Hugo',
    'dob' => '13/09/2019',
    'vet_id' => vet2.id,
    'owner_id' => owner3.id,
    'type' => 'clown fish',
    'notes' => ''
  }
)

pet3 = Pet.new(
  {
    'name' => 'Stanley',
    'dob' => '02/02/2017',
    'vet_id' => vet2.id,
    'owner_id' => owner1.id,
    'type' => 'guinea pig',
    'notes' => ''
  }
)

pet4 = Pet.new(
  {
    'name' => 'Humphrey',
    'dob' => '17/05/2011',
    'vet_id' => vet3.id,
    'owner_id' => owner2.id,
    'type' => 'dog',
    'notes' => ''
  }
)

pet5 = Pet.new(
  {
    'name' => 'Pricilla',
    'dob' => '19/01/2018',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => 'cat',
    'notes' => ''
  }
)

pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()
