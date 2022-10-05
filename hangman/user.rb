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

  def time
    @time
  end

  def to_score_record
    "#{@name} : #{@time} seconds"
  end
end
