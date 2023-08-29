require_relative 'app'

class Main
  OPTIONS_HANDLER = {
    '1' => :handle_list_books,
    '2' => :handle_list_people,
    '3' => :handle_create_person,
    '4' => :handle_create_book,
    '5' => :handle_create_rental,
    '6' => :handle_list_rentals,
    '7' => :handle_exit
  }.freeze

  def initialize
    @app = App.new
    @option_handler = OptionHandler.new(@app)
  end

  def run
    display_welcome_message
    process_handler_options
    display_exit_message
  end

  private

  def process_handler_options
    loop do
      display_handler
      option = gets.chomp

      if OPTIONS_HANDLER.key?(option)
        send(OPTIONS_HANDLER[option])
      else
        puts 'That is not valid number'
      end

      break if option == '7'
    end
  end

  def handle_list_books
    @option_handler.list_books
  end

  def handle_list_people
    @option_handler.list_people
  end

  def handle_create_person
    @option_handler.create_person
  end

  def handle_create_book
    @option_handler.create_book
  end

  def handle_create_rental
    @option_handler.create_rental
  end

  def handle_list_rentals
    @option_handler.list_rentals
  end

  def handle_exit
    # There's no requirement to take any action; simply exit the loop.
  end

  def display_welcome_message
    puts 'Welcome to the School Library App!\n'
  end

  def display_handler
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def display_exit_message
    puts 'Thank you! See you Later.'
  end
end

class OptionHandler
  def initialize(app)
    @app = app
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals
    @app.list_rentals
  end
end

main = Main.new
main.run
