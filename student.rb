require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: nil)
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
