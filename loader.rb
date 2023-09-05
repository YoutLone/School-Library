require_relative 'preserve_data'

class Loader
  def initialize(app)
    @preserve_data = PreserveData.new
    @app = app
  end

  def load_books
    books = @preserve_data.read_data('data/books.json') if File.exist?('data/books.json')
    return unless books

    books.each do |book|
      @app.create_book_file(book['title'], book['author'])
    end
  end

  def load_persons
    persons = @preserve_data.read_data('data/person.json') if File.exist?('data/person.json')
    return unless persons

    persons.each do |person|
      if person['type'] == 'Student'
        @app.create_student_file(person['name'], person['age'], person['parent_permission'])
      else
        @app.create_teacher_file(person['name'], person['age'], person['specialization'])
      end
    end
  end

  def load_rentals
    rentals = @preserve_data.read_data('data/rentals.json') if File.exist?('data/rentals.json')
    return unless rentals

    rentals.each do |rental|
      @app.create_rental_file(rental['date'], rental['person_idx'], rental['book_idx'])
    end
  end

  def load_all
    load_books
    load_persons
    load_rentals
  end
end
