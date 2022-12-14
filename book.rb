require './rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    new_rentals = Rental.new(date, self, person)
    @rentals.push(new_rentals) unless @rentals.include?(new_rentals)
  end
end
