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

  def vet()
    sql = "SELECT * FROM vets WHERE id = $1"
    values = [@vet_id]
    result = SqlRunner.run(sql, values)
    return Vet.new(result.first)
  end
  
  def owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    result = SqlRunner.run(sql, values)
    return Owner.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM pets"
    results = SqlRunner.run(sql)
    return results.map {|pet| Pet.new(pet)}
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Pet.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM pets"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM pets WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end



end
