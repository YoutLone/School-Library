require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(30, 'JK Rowling', parent_permission: 'true')
  end

  it 'checking person instance' do
    expect(@person).to be_instance_of Person
  end

  it 'checking attributes' do
    puts @person.name
    puts @person.age
    puts @person.parent_permission
    expect(@person).to have_attributes(age: 30, name: 'JK Rowling', parent_permission: 'true')
  end

  it 'test for add_rental' do
    book = double('book', rental: [])
    allow(book).to receive(:title) { 'Harry Potter' }
    allow(book).to receive(:author) { 'JK Rowling' }
    date = '02-23-2020'
    rental = @person.add_rental(book, date)
    expect(@person.rental).to include(rental)
    expect(rental.book.title).to eq('Harry Potter')
    expect(rental.date).to eq(date)
  end

  it 'correct name method' do
    expect(@person.correct_name).to eq('JK Rowling')
  end

  it 'correct age method' do
    expect(@person.send('of_age?')).to be true
  end

  it 'can use services' do
    expect(@person.can_use_service?).to be true
  end
end
