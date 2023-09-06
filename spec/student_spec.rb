require_relative '../student'

describe Student do
  let(:student) { Student.new(16, 'Alice', parent_permission: true) }
  let(:classroom) { double('classroom', add_student: true) }

  context 'attributes' do
    it 'has an ID' do
      expect(student.id).to be_a(Integer)
    end

    it 'has a name' do
      expect(student.name).to eq('Alice')
    end

    it 'has an age' do
      expect(student.age).to eq(16)
    end

    it 'has a parent permission' do
      expect(student.instance_variable_get(:@parent_permission)).to be true
    end

    it 'has a classroom' do
      expect(student.instance_variable_get(:@classroom)).to be_nil
    end
  end

  context 'play_hooky' do
    it 'returns a string' do
      expect(student.play_hooky).to be_a(String)
    end
  end
end
