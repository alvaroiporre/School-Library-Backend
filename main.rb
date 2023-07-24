require_relative 'Person'
require_relative 'Student'
require_relative 'Teacher'

#Test of Person class
person = Person.new( 25, "John Doe")

#Getters
puts "Person ID: #{person.id}"
puts "Person Name: #{person.name}"
puts "Person Age: #{person.age}"

#Setters
person.name = "Alice"
person.age = 30

#Getters after update
puts "Updated Person Name: #{person.name}"
puts "Updated Person Age: #{person.age}"

#Test Student class
student = Student.new(16, "Bob", false, 1)

#Getters
puts "Student ID: #{student.id}"
puts "Student Name: #{student.name}"
puts "Student Age: #{student.age}"

puts "Play Hooky function #{student.play_hooky}"

#Test Teacher class
teacher = Teacher.new(40, 'Robert Hoppenheimer', false, 1)

#Getters
puts "Teacher ID: #{teacher.id}"
puts "Teacher Name: #{teacher.name}"
puts "Teacher Age: #{teacher.age}"

#can_use_services? override method
puts "Teacher can_use_services? #{teacher.can_use_services?}"
