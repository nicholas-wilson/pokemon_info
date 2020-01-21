class PokemonInfo::Pokemon
  attr_accessor :name, :number, :types, :info_link_name, :weaknesses, :abilities
  @@all = []

  def initialize(name, types)
    @number = @@all.size + 1
    self.check_edge_cases(name)
    @types = types

    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.create_from_pokemondb
    PokemonInfo::Scraper.scrape_from_pokemondb
    # PokemonInfo::Pokemon.add_details_to_all_pokemon  decided against loading on launch
  end

  def self.search_by_name(pokemon)
    self.all.find {|i| i.name.downcase == pokemon.downcase}
    #=> returns pokemon obj with name of pokemon
  end

  def check_edge_cases(name)
    if @number == 29
      @name = "Nidoran-female"
      @info_link_name = @name
    elsif @number == 32
      @name = "Nidoran-male"
      @info_link_name = @name
    elsif @number == 83
      @name = name
      @info_link_name = "farfetchd"
    elsif @number == 122
      @name = name
      @info_link_name = "mr-mime"
    elsif @number == 439
      @name = name
      @info_link_name = "mime-jr"
    elsif @number == 669
      @name = name
      @info_link_name = "flabebe"
    elsif @number == 772
      @name = name
      @info_link_name = "type-null"
    elsif @number == 785
      @name = name
      @info_link_name = "tapu-koko"
    elsif @number == 786
      @name = name
      @info_link_name = "tapu-lele"
    elsif @number == 787
      @name = name
      @info_link_name = "tapu-bulu"
    elsif @number == 788
      @name = name
      @info_link_name = "tapu-fini"
    elsif @number == 865
      @name = name
      @info_link_name = "sirfetchd"
    elsif @number == 866
      @name = name
      @info_link_name = "mr-rime"
    else
      @name = name
      @info_link_name = name
    end
  end
end
