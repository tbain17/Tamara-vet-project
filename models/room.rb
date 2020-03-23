require_relative('../db/sql_runner')

class Room

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i()
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO rooms
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE rooms SET
      name
    =
      $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM rooms"
    results = SqlRunner.run(sql)
    return results.map {|room| Room.new(room)}
  end

  def self.find(id)
    sql = "SELECT * FROM rooms WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Room.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM rooms"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM rooms WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
