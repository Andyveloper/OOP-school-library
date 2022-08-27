require_relative './book'
require_relative './school_person'
require_relative './rental'
require_relative './school_student'
require_relative './school_teacher'
require_relative './UI/main_screen'

class App
  def initialize
    @screen = MainScreen.new
    @person_list = []
    @book_list = []
    @rental_list = []
  end

  def run
    @screen.initial
    print '   Select a option number, then press [ENTER]: '
    opc = gets.chomp.to_i

    case opc
    when 1
      book_list
    when 2
      people_list
    when 3
      add_person
    when 4
      add_book
    when 5
      rent_a_book
    when 6
      rent_history
    else
      @screen.exit
    end
  end

  # OPTION 1
  def book_list
    @screen.book_list(@book_list)
    gets.chomp
    run
  end

  # OPTION 2
  def people_list
    @screen.people_list(@person_list)
    gets.chomp
    run
  end

  # OPTION 3
  def add_person
    @screen.add_person
    print '   Enter [1] for Student, or [2] for Teacher: '
    opc = gets.chomp.to_i
    @person_list.push(new_person(opc))
    goback
  end

  # OPTION 4
  def add_book
    @screen.add_book
    print '   Enter a title: '
    title = gets.chomp
    print '   Enter a author: '
    author = gets.chomp

    new_book = Book.new(title.capitalize, author.capitalize)

    @book_list.push(new_book)
    goback
  end

  # OPTION 5
  def rent_a_book
    @screen.rent_a_book(@book_list, @person_list)
    if @book_list.length.positive? && @person_list.length.positive?
      print '   Select a book: '
      book = gets.chomp.to_i
      print '   Select a person: '
      person = gets.chomp.to_i
      print '   Enter a date [YYYY-MM-DD]: '
      date = gets.chomp
      new_rental = Rental.new(date, @book_list[book - 1], @person_list[person - 1])
      @rental_list.push(new_rental)
      goback
    else
      gets.chomp
      run
    end
  end

  # OPTION 6
  def rent_history
    @screen.rent_history(@person_list, nil, true)
    if @person_list.length.positive?
      print '   Select a person: '
      person = gets.chomp.to_i
      if @person_list[person - 1]
        @screen.rent_history(nil, @person_list[person - 1], true)
      else
        @screen.rent_history(nil, nil, false)
      end
    end
    gets.chomp
    run
  end

  def goback
    @screen.success
    sleep(2)
    run
  end

  def new_person(opc)
    case opc
    when 1
      print '   Enter a name: '
      name = gets.chomp
      print '   Enter a age: '
      age = gets.chomp.to_i
      print '   Has parent persmision [Y/N]: '
      permision = gets.chomp.downcase
      Student.new(age, nil, name.capitalize, permision == 'y')
    when 2
      print '   Enter a name: '
      name = gets.chomp
      print '   Enter a age: '
      age = gets.chomp.to_i
      print '   Enter specialization: '
      specialization = gets.chomp
      Teacher.new(age, specialization.capitalize, name.capitalize)
    else
      run
    end
  end
end
