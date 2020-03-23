require_relative('../db/sql_runner')

class Treatment

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i()
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO treatments
    (
      type
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE treatments SET
    (
      type
    )
    =
    (
      $1
    )
    WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM treatments"
    results = SqlRunner.run(sql)
    return results.map {|treatment| Treatment.new(treatment)}
  end

  def self.find(id)
    sql = "SELECT * FROM treatments WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Treatment.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM treatments"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM treatments WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
