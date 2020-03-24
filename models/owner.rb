require_relative('../db/sql_runner')

class Owner

  attr_reader :id
  attr_accessor :first_name, :last_name, :phone_number, :email, :status

  def initialize(options)
    @id = options['id'].to_i()
    @first_name = options['first_name']
    @last_name = options['last_name']
    @phone_number = options['phone_number']
    @email = options['email']
    @status = options['status']
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      phone_number,
      email,
      status
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @phone_number, @email, 'registered']
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET
    (
      first_name,
      last_name,
      phone_number,
      email
    )
    =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @phone_number, @email, @id]
    SqlRunner.run(sql, values)
  end

  def unregister()
    sql = "UPDATE owners SET
    status
    =
    $1
    WHERE id = $2"
    values = ['unregistered', @id]
    SqlRunner.run(sql, values)
  end

  def joined_name()
    return "#{@first_name} #{@last_name}"
  end

  def pets()
    sql = "SELECT * FROM pets WHERE owner_id = $1"
    values = [@id]
    pets = SqlRunner.run(sql, values)
    return pets.map{|pet|Pet.new(pet)}
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map {|owner| Owner.new(owner)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Owner.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM owners WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
