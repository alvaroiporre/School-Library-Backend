require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

# Test of Person class
person = Person.new(25, name: 'John Doe')

# Getters
puts "Person ID: #{person.id}"
puts "Person Name: #{person.name}"
puts "Person Age: #{person.age}"

# Setters
person.name = 'Alice'
person.age = 30

# Getters after update
puts "Updated Person Name: #{person.name}"
puts "Updated Person Age: #{person.age}"

# Test Student class
student = Student.new(16, 1, name: 'Bob', parent_permission: false)

# Getters
puts "Student ID: #{student.id}"
puts "Student Name: #{student.name}"
puts "Student Age: #{student.age}"

puts "Play Hooky function #{student.play_hooky}"

# Test Teacher class
teacher = Teacher.new(40, 1, name: 'Robert Hoppenheimer', parent_permission: false)

# Getters
puts "Teacher ID: #{teacher.id}"
puts "Teacher Name: #{teacher.name}"
puts "Teacher Age: #{teacher.age}"

# can_use_services? override method
puts "Teacher can_use_services? #{teacher.can_use_services?}"


#Test Decorators
person = Person.new(22, name: 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name