require './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    new_rentals = Rental.new(date, book, self)
    @rentals.push(new_rentals) unless @rentals.include?(new_rentals)
  end

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
