# rubocop:disable Lint/MissingCopEnableDirective, Metrics/AbcSize, Metrics/CyclomaticComplexity

require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(age, name, role)
    if role.downcase == '2'
      puts 'Specialization:'
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name: name)
      puts 'Person created successfully'

    elsif role.downcase == '1'
      puts 'Has parent permission? [Y/N]:'
      permission = gets.chomp
      @people << Student.new(age, name: name, parent_permission: permission.upcase == 'Y')
      puts 'Person created successfully'
    else
      puts "Invalid role. Only 'teacher' or 'student' allowed."
    end
  end

  def create_book(title, author)
    @books << Book.new(title, author)
    puts 'Book created succesfullly'
  end

  def create_rental(index_book, index_person, rental_date)
    if index_person < @people.length && index_book < @books.length
      @people[index_person].add_rental(@books[index_book], rental_date)
      puts 'Rental created succesfully'
    else
      puts 'Person or book not found. Rental creation failed.'
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |per| per.id == person_id }
    if person
      puts "Rentals for #{person.name}:"
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    else
      puts 'Person not found.'
    end
  end

  def call_app(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      puts 'Do you want to create a student (1) or a teacher(2)? [Input the number]:'
      role = gets.chomp
      puts 'Age: '
      age = gets.chomp
      puts 'Name: '
      name = gets.chomp
      create_person(age, name, role)
    when 4
      puts 'Title:'
      title = gets.chomp
      puts 'Author:'
      author = gets.chomp
      create_book(title, author)
    when 5
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
      index_book = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, idx|
        puts "#{idx})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      index_person = gets.chomp.to_i

      puts 'Date [YYYY-MM-DD]:'
      rental_date = gets.chomp
      create_rental(index_book, index_person, rental_date)
    when 6
      puts 'ID of person: '
      person_id = gets.chomp.to_i
      list_rentals_for_person(person_id)
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def run
    loop do
      puts "Wlcome to Schoo Library App!\n"
      puts "\nPlease choose an option by entering a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person (teacher or student)'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person ID'
      puts '7 - Exit'

      choice = gets.chomp.to_i
      call_app(choice)
    end
  end
end
