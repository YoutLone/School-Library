require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Mr. Smith', 'Math', parent_permission: true) }

  context 'attributes' do
    it 'has an ID' do
      expect(teacher.id).to be_a(Integer)
    end

    it 'has a name' do
      expect(teacher.name).to eq('Mr. Smith')
    end

    it 'has an age' do
      expect(teacher.age).to eq(30)
    end

    it 'has a parent permission' do
      expect(teacher.instance_variable_get(:@parent_permission)).to be true
    end

    it 'has a specialization' do
      expect(teacher.instance_variable_get(:@specialization)).to eq('Math')
    end
  end

  context 'can_use_service?' do
    it 'returns true' do
      expect(teacher.can_use_service?).to be true
    end
  end
end
