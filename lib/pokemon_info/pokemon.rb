class PokemonInfo::Pokemon
  attr_accessor :name, :number, :types, :weaknesses, :abilities
  @@all = []

  def initialize(name, types)
    @number = @@all.size + 1
    if @number == 29
      @name = "nidoran-female"
    elsif @number == 32
      @name = "nidoran-male"
    else
      @name = name
    end
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
    # use Pokemon.scrape_from_official_site to make pokemon
    PokemonInfo::Pokemon.scrape_from_pokemondb
    PokemonInfo::Pokemon.add_details_to_all_pokemon
  end

  def self.scrape_from_pokemondb
    # uses nokogiri and open-uri to pull
    page = Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))
    pokemon = page.css("div.infocard-list.infocard-list-pkmn-lg div.infocard")
    pokemon.each do |mon|
      info = mon.css("span.infocard-lg-data.text-muted")
      name = info.css("a")[0].text
      types = []
      if info.css("a").size ==  3
        types = [info.css("a")[1].text, info.css("a")[2].text]
      else
        types = [info.css("a")[1].text]
      end
      PokemonInfo::Pokemon.new(name, types)
    end
  end

  def self.add_details_to_all_pokemon
    # uses info link and returns extra info to make Pokemon
    @@all.each do |pokemon|
      if pokemon.number < 810
        specs_page = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/#{pokemon.name.downcase}"))
      end
    end
  end
end
