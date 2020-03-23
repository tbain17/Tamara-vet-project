require_relative('../db/sql_runner')

class Treatment

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i()
    @type = options['type']
  end

end
