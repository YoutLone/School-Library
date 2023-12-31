require_relative '../rental'

describe Rental do
  before :each do
    person = double('Person', rental: [])
    allow(person).to receive(:age) { 12 }
    allow(person).to receive(:name) { 'JK Rowling' }
    allow(person).to receive(:parent_permission) { true }

    book = double('book', rental: [])
    allow(book).to receive(:title) { 'Harry Potter' }
    allow(book).to receive(:author) { 'JK Rowling' }

    @rental = Rental.new('2020-05-24', person, book)
  end

  it 'checking rental instance' do
    expect(@rental).to be_instance_of Rental
  end

  it 'checking attributes' do
    expect(@rental.date).to eq('2020-05-24')
  end

  it 'checking for book' do
    expect(@rental.book.title).to eq('Harry Potter')
  end

  it 'checking for person' do
    expect(@rental.person.name).to eq('JK Rowling')
  end
end
