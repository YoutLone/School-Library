require_relative '../book'

describe Book do
  before :each do
    @book = Book.new 'Rich Dad Poor Dad', 'Robert T.Kiyosaki'
  end

  it 'checking book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'checking attributes' do
    expect(@book).to have_attributes(title: 'Rich Dad Poor Dad', author: 'Robert T.Kiyosaki')
  end

  it 'test for add_rental' do
    person = double('Person', rental: [])
    allow(person).to receive(:age) { '12' }
    allow(person).to receive(:name) { 'Robert T.Kiyosaki' }
    allow(person).to receive(:parent_permission) { true }
    rental = @book.add_rental(person, '2023-02-03')
    puts rental.person.age
    expect(rental.person.name).to eq('Robert T.Kiyosaki')
  end
end
