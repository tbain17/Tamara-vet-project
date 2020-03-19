require_relative('../db/sql_runner')

class Pet

  attr_accessor :name, :dob, :vet_id, :owner_id, :type, :notes
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
    @dob = options['dob']
    @vet_id = options['vet_id'].to_i()
    @owner_id = options['owner_id'].to_i()
    @type = options['type']
    @notes = options['notes']
  end

  def save()
    sql = "INSERT INTO pets
    (
      name,
      dob,
      vet_id,
      owner_id,
      type,
      notes
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @dob, @vet_id, @owner_id, @type, @notes]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


end
