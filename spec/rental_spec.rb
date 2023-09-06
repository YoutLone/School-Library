require 'date'
require_relative '../rental'

describe Rental do
  let(:date) { Date.new(2023, 9, 6) }
  let(:person) { double('person', rental: []) }
  let(:book) { double('book', rental: []) }
  let(:rental) { Rental.new(date, person, book) }

  context 'attributes' do
    it 'has a date' do
      expect(rental.date).to eq(date)
    end

    it 'has a person' do
      expect(rental.person).to eq(person)
    end

    it 'has a book' do
      expect(rental.book).to eq(book)
    end
  end

  context 'associations' do
    it 'adds itself to the person\'s rental history' do
      expect(person.rental).to include(rental)
    end

    it 'adds itself to the book\'s rental history' do
      expect(book.rental).to include(rental)
    end
  end
end
