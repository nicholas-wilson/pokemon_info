class PokemonInfo::CLI

  def call
    input = ""
    until input.downcase == "exit"
      self.display_menu
      input = gets.chomp
      if input == "1"
        self.list_by_name
      elsif input == "2"
        self.list_by_number
      elsif input == "3"
        self.search_name
      elsif input == "4"
        self.search_number
      elsif input.downcase == "exit"
        puts "Thanks for using Pokemon Info, Cya later!"
      else
        puts "Sorry, I don't know what you mean by #{input}. Please try again"
      end
    end
  end

  def display_menu
    puts "Please choose one of the following options or type 'exit' to quit."
    puts "---------------------------------------------------------------------"
    puts "1. List Pokemon by name"
    puts "2. List Pokemon by number"
    puts "3. Search by name"
    puts "4. Search by number"
    puts "---------------------------------------------------------------------"
  end

  def list_by_name
    puts "Here's a list of all the Pokemon in Alphabetical order!"
    puts "---------------------------------------------------------------------"
  end
end
