DROP TABLE pets;
DROP TABLE rooms;
DROP TABLE owners;
DROP TABLE vets;
DROP TABLE treatments;

CREATE TABLE vets
(
  id SERIAL primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  specialty VARCHAR(255)
);

CREATE TABLE owners
(
  id SERIAL primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  phone_number VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE rooms
(
  id SERIAL primary key,
  name VARCHAR(255)
);

CREATE TABLE treatments
(
  id SERIAL primary key,
  type VARCHAR(255)
);

CREATE TABLE pets
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  DoB VARCHAR(255),
  vet_id INT REFERENCES vets(id) ON DELETE CASCADE,
  owner_id INT REFERENCES owners(id) ON DELETE CASCADE,
  type VARCHAR(255),
  notes VARCHAR(255)
);
