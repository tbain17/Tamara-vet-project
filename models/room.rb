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

  def self.all()
    sql = "SELECT * FROM rooms"
    results = SqlRunner.run(sql)
    return results.map {|room| Room.new(room)}
  end

end
