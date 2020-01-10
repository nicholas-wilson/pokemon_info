class PokemonInfo::CLI

  def call
    input = ""
    until input.downcase == "exit"
      self.display_menu
      input = gets.chomp
      if input == "1"
        self.list_by_number
      elsif input == "2"
        self.search_name
      elsif input == "3"
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
    puts "1. List Pokemon by number"
    puts "2. Search by name"
    puts "3. Search by number"
    puts "---------------------------------------------------------------------"
  end

  def list_by_number
    input = ""
    until input == ""
      display_gen_listing
      input = gets.chomp
      if input == "1"
        self.list_gen(1, 151)
      elsif input == "2"
        self.list_gen(152, 251)
      elsif input == "3"
        self.list_gen(252, 386)
      elsif input == "4"
        self.list_gen(387, 493)
      elsif input == "5"
        self.list_gen(494, 649)
      elsif input == "6"
        self.list_gen(650, 721)
      elsif input == "7"
        self.list_gen(722, 809)
      else
        puts "Back to main menu."
      end
    end

  end

  def search_name
    puts "Enter the name of the Pokemon to display info for"
    input = gets.chomp
    puts "Here's the info!"
  end

  def search_number
    puts "Enter the number of the Pokemon to display info for"
    input = gets.chomp
    puts "Here's the info!"
  end

  def display_gen_listing
    puts "Please choose which group of Pokemon to be listed"
    puts "---------------------------------------------------------------------"
    puts "1. All of First Gen (1 - 151)"
    puts "2. All of Second Gen (152 - 251)"
    puts "3. All of Third Gen (252 - 386)"
    puts "4. All of Fourth Gen (387 - 493)"
    puts "5. All of Fifth Gen (494 - 649)"
    puts "6. All of Sixth Gen (650 - 721)"
    puts "7. All of Seventh Gen (722 - 809)"
    puts "8. All Pokemon (not recommended as it is a lot of text)"
    puts "*8th Generation Pokemon to be added later."
  end

  def list_gen(start_num, end_num)
    puts "Displaying #{start_num} to #{end_num}!"
  end
end
