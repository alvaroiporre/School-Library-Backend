require_relative 'Person'


person = Person.new(1, 25, "John Doe")

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