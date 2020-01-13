# PokemonInfo

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pokemon_info`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pokemon_info'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pokemon_info

## Usage

This program is command line interface controlled, meaning that you must follow
menu prompts and type in and enter commands as requested by the program. This program
can be used to display the names of all pokemon and can also show each pokemon's types,
weaknesses, and abilities. The type of information shown for each pokemon will depend
on if it is included in the newest generation (Pokemon Sword/Shield), as the newest
pokemon will not show the weaknesses and abilities.


Searching for a pokemon's data
  There are two ways this can be accomplished:
    1. Searching by name
      -   To search by name select the main menu option to search by name and then type in
        the pokemon's name exactly how it would appear in the game.
        *Note* - for Nidoran please type in nidoran-male or nidoran-female when searching
    2. Searching by the national dex number
      -   To search by national dex number simply choose the option to search by number
        on the main menu and then type in the national dex number of the desired pokemon.
        acceptable numbers are between 1 and 890.

Listing the pokemon
  When choosing to list pokemon from the main menu, you will be asked which set of
  pokemon whose names are to be listed. After choosing which set of pokemon to be
  listed you will be prompted to enter in the name of a pokemon to display info for.
  The name of the pokemon does not have to be from the set just listed, and if you
  don't want to enter a name just enter something to be taken back to a previous menu.

Exiting
  When done with the program simply enter exit on the main menu to stop the program.
  If you are not currently on the main menu when typing exit and can't figure out
  how to navigate back to the main menu you can keep entering 'exit' to do so.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'wondrous-operand-3019'/pokemon_info. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PokemonInfo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'wondrous-operand-3019'/pokemon_info/blob/master/CODE_OF_CONDUCT.md).
