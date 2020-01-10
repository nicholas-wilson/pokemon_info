class PokemonInfo::Pokemon
  attr_accessor :name, :number, :types, :weaknesses
  @@all = []

  def initialize(name, number, types, weaknesses)
    @name = name
    @number = number
    @types = types
    @weaknesses = weaknesses

    @@all << self
  end
end
