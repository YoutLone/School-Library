require_relative '../person'

describe Person do
  let(:person) { Person.new(25, 'John Doe') }
  let(:young_person) { Person.new(15, 'Alice', parent_permission: true) }

  context 'attributes' do
    it 'has an ID' do
      expect(person.id).to be_a(Integer)
    end

    it 'has a name' do
      expect(person.name).to eq('John Doe')
    end

    it 'has an age' do
      expect(person.age).to eq(25)
    end

    it 'has a rental history' do
      expect(person.rental).to be_an(Array)
    end
  end

  context 'age verification' do
    it 'is of age' do
      expect(person.send(:of_age?)).to be true
    end

    it 'is not of age and has parent permission' do
      expect(young_person.send(:of_age?)).to be false
      expect(young_person.send(:can_use_services?)).to be true
    end

    it 'is not of age and does not have parent permission' do
      young_person.instance_variable_set(:@parent_permission, false)
      expect(young_person.send(:can_use_services?)).to be false
    end
  end
end
