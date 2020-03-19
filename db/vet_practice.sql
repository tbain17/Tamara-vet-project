DROP TABLE pets;
DROP TABLE owners;
DROP TABLE vets;

CREATE TABLE vets
(
  id SERIAL primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null
);

CREATE TABLE owners
(
  id SERIAL primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null
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
