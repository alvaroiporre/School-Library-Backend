require_relative 'nameable'

class Person < Nameable
  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id, :rentals

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    rentals << Rental.new(date, book, self)
    book.add_rental(self, date)
  end

  private

  def of_age?
    @age >= 18
  end
end
