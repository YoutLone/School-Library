require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Math Class') }
  let(:student) { double('student', classroom: nil) }

  context 'attributes' do
    it 'has a label' do
      expect(classroom.label).to eq('Math Class')
    end

    it 'has an empty student array' do
      expect(classroom.student).to be_an(Array)
      expect(classroom.student).to be_empty
    end
  end

  context 'add_student' do
    it 'adds a student to the classroom' do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
      expect(classroom.student).to include(student)
    end

    it 'sets the student\'s classroom attribute' do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
    end
  end
end
