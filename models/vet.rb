require_relative('../db/sql_runner')

class Vet

  attr_reader :id
  attr_accessor :first_name, :last_name, :specialty

  def initialize(options)
    @id = options['id'].to_i()
    @first_name = options['first_name']
    @last_name = options['last_name']
    @specialty = options['specialty']
  end

  def save()
    sql = "INSERT INTO vets
    (
      first_name,
      last_name,
      specialty
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @specialty]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def joined_name()
    return "#{@first_name} #{@last_name}"
  end

  def self.all()
    sql = "SELECT * FROM vets"
    results = SqlRunner.run(sql)
    return results.map {|vet| Vet.new(vet)}
  end

  def self.find(id)
    sql = "SELECT * FROM vets WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Vet.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM vets WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end



end
