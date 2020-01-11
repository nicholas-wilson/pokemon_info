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
    PokemonInfo::Pokemon.scrape_from_pokemondb
    PokemonInfo::Pokemon.add_details_to_all_pokemon
  end

  def self.search_by_name(pokemon)
    self.all.find {|i| i.name.downcase == pokemon.downcase}
    #=> returns pokemon obj with name of pokemon
  end

  def self.scrape_from_pokemondb
    # uses nokogiri and open-uri to pull
    page = Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))
    pokemon = page.css("div.infocard-list.infocard-list-pkmn-lg div.infocard")
    pokemon.each do |mon|
      info = mon.css("span.infocard-lg-data.text-muted")
      name = info.css("a")[0].text #holds pokemon name
      types = []
      if info.css("a").size ==  3
        types = [info.css("a")[1].text, info.css("a")[2].text] # [1] and [2] hold the types
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
        puts "Pokemon: #{pokemon.name}"
        specs_page = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/#{pokemon.info_link_name.downcase}"))
        # adding abilities to pokemon
        abilities = specs_page.css("div.pokemon-ability-info.color-bg.color-lightblue.match.active div.pokemon-ability-info-detail.match")
        abilities_and_info = []
        abilities.each do |ability|
          abilities_and_info << ability.css("h3").text #the name of the ability
          abilities_and_info << ability.css("p").text #description of ability
        end
        pokemon.abilities = abilities_and_info
        # adding weaknesses to pokemon
        weaknesses_raw = specs_page.css("div.pokedex-pokemon-attributes.active div.dtm-weaknesses ul li")
        weaknesses = []
        weaknesses_raw.each do |weakness|
          weaknesses << weakness.css("a span").text
        end
        pokemon.weaknesses = weaknesses
      end
    end
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
