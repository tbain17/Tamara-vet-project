require_relative('../db/sql_runner')

class Appointment

  attr_reader :id
  attr_accessor :pet_id, :room_id, :treatment_id, :time

  def initialize(options)
    @id = options['id'].to_i()
    @pet_id = options['pet_id'].to_i()
    @room_id = options['room_id'].to_i()
    @treatment_id = options['treatment_id'].to_i()
    @time = options['time']
  end

  def save()
    sql = "INSERT INTO appointments
    (
    pet_id,
    room_id,
    treatment_id,
    time
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@pet_id, @room_id, @treatment_id, @time]
    appointment = SqlRunner.run(sql, values)[0]
    @id = appointment['id'].to_i()
  end

  def update()
    sql = "UPDATE owners SET
    (
      pet_id,
      room_id,
      treatment_id,
      time
    )
    =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@pet_id, @room_id, @treatment_id, @time, @id]
    SqlRunner.run(sql, values)
  end

  def pet()
    sql = "SELECT * FROM pets WHERE id = $1"
    values = [@pet_id]
    result = SqlRunner.run(sql, values)
    return Pet.new(result.first)
  end

  def room()
    sql = "SELECT * FROM rooms WHERE id = $1"
    values = [@room_id]
    result = SqlRunner.run(sql, values)
    return Room.new(result.first)
  end

  def treatment()
    sql = "SELECT * FROM treatments WHERE id = $1"
    values = [@treatment_id]
    result = SqlRunner.run(sql, values)
    return Treatment.new(result.first)
  end

  def vet()
    sql = "SELECT * FROM vets WHERE id = $1"
    vet_id = self.pet.vet_id
    values = [vet_id]
    result = SqlRunner.run(sql, values)
    return Vet.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM appointments"
    results = SqlRunner.run(sql)
    return results.map {|appointment| Appointment.new(appointment)}
  end

  def self.find(id)
    sql = "SELECT * FROM appointments WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Appointment.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM appointments"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM appointments WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
