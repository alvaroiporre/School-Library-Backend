require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require './book'
require './rental'
require './classroom'

# # Test of Person class
# person = Person.new(25, name: 'John Doe')
#
# Getters
# puts "Person ID: #{person.id}"
# puts "Person Name: #{person.name}"
# puts "Person Age: #{person.age}"
#
# Setters
# person.name = 'Alice'
# person.age = 30
#
# Getters after update
# puts "Updated Person Name: #{person.name}"
# puts "Updated Person Age: #{person.age}"
#
# Test Student class
# student = Student.new(16, name: 'Bob', parent_permission: false)
#
# Getters
# puts "Student ID: #{student.id}"
# puts "Student Name: #{student.name}"
# puts "Student Age: #{student.age}"
#
# puts "Play Hooky function #{student.play_hooky}"
#
# Test Teacher class
# teacher = Teacher.new(40, 1, name: 'Robert Hoppenheimer', parent_permission: false)
#
# Getters
# puts "Teacher ID: #{teacher.id}"
# puts "Teacher Name: #{teacher.name}"
# puts "Teacher Age: #{teacher.age}"
#
# can_use_services? override method
# puts "Teacher can_use_services? #{teacher.can_use_services?}"
#
# Test Decorators
# person = Person.new(22, name: 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

# Creating a Classroom object
classroom = Classroom.new('Math Class')

# Creating Student objects
student1 = Student.new(16, name: 'Alice')
student2 = Student.new(17, name: 'Bob')

# Adding students to the classroom
classroom.add_student(student1)
classroom.add_student(student2)

# Accessing the classroom for each student
puts "#{student1.name} belongs to #{student1.classroom.label}" # Output: Alice belongs to Math Class
puts "#{student2.name} belongs to #{student2.classroom.label}" # Output: Bob belongs to Math Class

# Accessing the students in the classroom
puts "Students in the #{classroom.label} classroom:"
classroom.students.each { |student| puts student.name }

# Creating Book objects
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')

# Creating Person objects
person1 = Person.new(33, name: 'Bea')
person2 = Person.new(24, name: 'Rob')

# Creating Rental objects
person1.add_rental(book1, '2023-07-24')
person1.add_rental(book2, '2023-07-25')
person2.add_rental(book1, '2023-07-26')


# Accessing rentals for person1
puts "#{person1.name}'s rentals:"
person1.rentals.each { |rental| puts "#{rental.book.title} (#{rental.date})" }

# Accessing rentals for person2
puts "#{person2.name}'s rentals:"
person2.rentals.each { |rental| puts "#{rental.book.title} (#{rental.date})" }
