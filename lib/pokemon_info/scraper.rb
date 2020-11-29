class PokemonInfo::Scraper
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

  def self.add_details_to(pokemon)
    if pokemon.number <= 890
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
        weaknesses << weakness.css("a span").text.gsub(/\s+/, "")
      end
      pokemon.weaknesses = weaknesses
    end
  end
end
