require_relative 'preserve_data'

class Store
  def initialize
    @preserve_data = PreserveData.new
    @people = []
    @books = []
    @rentals = []
  end

  def store_people(file, data)
    @people = @preserve_data.read_data("data/#{file}") if File.exist?("data/#{file}")
    @people.push(data)
    @preserve_data.save_data("data/#{file}", @people)
  end

  def store_books(file, data)
    @books = @preserve_data.read_data("data/#{file}") if File.exist?("data/#{file}")
    @books.push(data)
    @preserve_data.save_data("data/#{file}", @books)
  end

  def store_rentals(file, data)
    @rentals = @preserve_data.read_data("data/#{file}") if File.exist?("data/#{file}")
    @rentals.push(data)
    @preserve_data.save_data("data/#{file}", @rentals)
  end
end
