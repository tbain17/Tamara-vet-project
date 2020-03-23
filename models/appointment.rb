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

end
