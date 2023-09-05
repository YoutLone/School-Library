require_relative 'app'
require_relative 'user_input'
require_relative 'loader'

class Main
  def initialize
    @app = App.new
    @loader = Loader.new(@app)
    @loader.load_all
  end

  puts 'Welcome to School Library App!'

  def run
    while @user_input != 7
      puts "\n"
      puts 'Please chose an option by entering a number :'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'

      @user_input = gets.chomp.to_i

      input(@user_input, @app)
    end
  end
end

main = Main.new
main.run
