class User
  def initialize(name)
    @name = name
  end

  def time=(time)
    @time = time
  end

  def name
    @name
  end

  def to_score_record
    return "#{@name}   |   #{@time} seconds"
  end
end
