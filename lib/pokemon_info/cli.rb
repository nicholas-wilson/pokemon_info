class PokemonInfo::CLI

  def call
    input = ""
    unless input.downcase == "exit"
      self.display_menu
      input = gets.chomp
    end
  end

  def display_menu
    puts "Please choose one of the following options"
    puts "1. List Pokemon by name"
    puts "2. List Pokemon by number"
    puts "3. Search by name"
    puts "4. Search by number"
    # puts "Here is some info about Pokemon..."
    # puts "Well there will be eventually..."
  end
end
