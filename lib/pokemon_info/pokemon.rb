class PokemonInfo::Pokemon
  attr_accessor :name, :number, :types, :info_link, :weaknesses, :abilities
  @@all = []

  def initialize(name, number, types, info_link)
    @name = name
    @number = number
    @types = types
    @info_link = info_link

    @@all << self
  end

  def self.create_from_official_site
    # use Pokemon.scrape_from_official_site to make pokemon
  end

  def self.scrape_from_official_site
    # uses nokogiri and open-uri to pull
    page = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"))
  end

  def self.scrape_info_link
    # uses info link and returns extra info to make Pokemon
    specs_page = Nokogiri::HTML(open(@info_link))
  end
end
