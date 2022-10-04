class Owner
  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_profile
    profile_separator = "=" * 50
    return "The owner of this diary is the great #{@age} years old #{@name}!\n#{profile_separator}"
  end
end
