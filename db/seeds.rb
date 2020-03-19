require_relative( "../models/owner" )
require_relative( "../models/vet" )
require_relative( "../models/pet" )
require("pry-byebug")

# Pet.delete_all()
# Owner.delete_all()
# Vet.delete_all()

vet1 = Vet.new (
  {
    'name' => ''
  }
)
vet2 = Vet.new (
  {
    'name' => ''
  }
)
vet3 = Vet.new (
  {
    'name' => ''
  }
)

vet1.save()
vet2.save()
vet3.save()

owner1 = Owner.new(
  {
    'name' => ''
  }
)
owner2 = Owner.new(
  {
    'name' => ''
  }
)
owner3 = Owner.new(
  {
    'name' => ''
  }
)

owner1.save()
owner2.save()
owner3.save()

pet1 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet2 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet3 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet4 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet5 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet6 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet7 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)

pet8 = Pet.new(
  {
    'name' => '',
    'dob' => '',
    'vet_id' => vet1.id,
    'owner_id' => owner2.id,
    'type' => '',
    'notes' => ''
  }
)


pet1.save()
pet2.save()
pet3.save()
pet4.save()
pet5.save()
pet6.save()
pet7.save()
pet8.save()
