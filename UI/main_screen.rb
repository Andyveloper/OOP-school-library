require './UI/template'

class MainScreen
  def initialize
    @width = 61
  end

  def initial
    header
    puts '║ [1] Book List                                             ║'
    puts '║ [2] People List                                           ║'
    puts '║ [3] Add Person                                            ║'
    puts '║ [4] Add Book                                              ║'
    puts '║ [5] Rent a Book                                           ║'
    puts '║ [6] Rental History                                        ║'
    puts '║ [7] Exit                                                  ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end

  def book_list(data)
    header
    puts '║ Book List                                                 ║'
    puts '╠═══════════════════════════════════════════════════════════╣'
    loop_book(data)
    footer
  end

  def people_list(data)
    header
    puts '║ People List                                               ║'
    puts '╠═══════════════════════════════════════════════════════════╣'
    loop_person(data)
    footer
  end

  def add_book
    header
    puts '║ Add Book                                                  ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end

  def rent_a_book(books, people)
    header
    puts '║ Rent a Book                                               ║'
    puts '╠═══════════════════════════════════════════════════════════╣'
    puts '║                      Book List                            ║'
    loop_book(books)
    puts '║                     Person List                           ║'
    loop_person(people)

    if books.length.positive? && people.length.positive?
      puts '╚═══════════════════════════════════════════════════════════╝'

    else
      footer
    end
  end

  def rent_history(*args)
    data, person, exist = args
    header
    rent_title(person)

    if !exist
      puts '║                 This person does not exist                ║'
    elsif person
      if person.rentals.length.positive?
        person.rentals.each do |rent|
          line = "║ #{rent.date} - #{rent.book.title} (#{rent.book.author})"
          puts "#{line} #{whitespace(line.length)}║"
        end
      else
        puts '║               -- No rentals available --                  ║'
      end
    else
      loop_person(data)
    end
    rent_footer(data)
  end

  def rent_title(person)
    if person
      line = "║  Rental history: #{person.name}"
      puts "#{line} #{whitespace(line.length)}║"
    else
      puts '║  Rental history                                           ║'
    end
    puts '╠═══════════════════════════════════════════════════════════╣'
  end

  def rent_footer(data)
    if data&.length&.positive?
      puts '╚═══════════════════════════════════════════════════════════╝'
    else
      footer
    end
  end

  def add_person
    header
    puts '║  Add a person                                             ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end

  def loop_book(data)
    if data.length.positive?
      data.each_with_index do |elem, index|
        line = "║ [#{index + 1}] #{elem.title} (#{elem.author})"
        puts "#{line} #{whitespace(line.length)}║"
      end
    else
      puts '║                -- No books available --                   ║'
    end
  end

  def loop_person(data)
    if data.length.positive?
      data.each_with_index do |elem, index|
        line = "║  [#{index + 1}] #{elem.name} (#{elem.class})"
        puts "#{line} #{whitespace(line.length)}║"
      end
    else
      puts '║               -- No people available --                   ║'
    end
  end

  def exit
    header
    puts '║                  THANK YOU, GOOD BYE!                     ║'
    puts '║     ██████                                                ║'
    puts '║     ██████                    ████▒▒████                  ║'
    puts '║   ████▒▒████████████████████████████▒▒██                  ║'
    puts '║ ██░░████▒▒██░░░░░░░░░░░░░░░░░░░░████▒▒████                ║'
    puts '║ ██░░░░░░████▒▒██░░░░░░░░░░░░██░░░░░░░░████▒▒██            ║'
    puts '║ ██░░░░░░██▒▒██░░░░░░░░░░░░░░░░██░░░░░░░░██▒▒██            ║'
    puts '║ ██░░░░░░██▒▒██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████          ║'
    puts '║ ██░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██          ║'
    puts '║ ██░░░░░░████░░░░░░██░░░░░░░░░░░░░░██░░░░░░░░  ░░██        ║'
    puts '║ ██░░░░░░██░░░░░░██░░░░░░░░░░░░░░░░██░░      ░░░░░░██      ║'
    puts '║ ██░░░░░░██░░░░░░██░░      ░░    ██  ██░░░░░░░░░░░░██      ║'
    puts '║ ██░░░░░░░░██░░░░░░██░░░░░░░░██░░░░██  ████░░░░██░░░░██    ║'
    puts '║ ██░░░░░░░░██░░░░██░░░░░░░░██░░░░██      ██░░░░░░██░░██    ║'
    puts '║ ██░░░░░░░░██░░░░██░░░░░░██░░░░░░██    ██████░░░░████      ║'
    puts '║ ██░░░░░░░░██░░████░░░░██████████      ██  ██░░░░████      ║'
    puts '║ ██░░░░░░░░██░░████████  ████  ██      ▒▒  ██░░░░██        ║'
    puts '║ ██░░░░░░░░████████▒▒░░    ▒▒          ░░  ██░░████████  ██║'
    puts '║ ██░░░░░░░░████░░██▒▒░░  ▒▒░░          ▒▒  ██░░████  ████  ██'
    puts '║ ██░░░░░░░░██  ████▒▒░░  ▒▒▒▒              ████░░██  ██    ██'
    puts '║ ██░░░░░░░░██    ██░░░░                  ████░░░░██      ██║'
    puts '║ ██░░░░░░░░██      ████░░            ██████░░░░░░██    ██  ║'
    puts '║ ██░░░░░░░░░░██        ██▓▓▓▓▓▓▓▓▓▓░░▓▓  ██░░░░██    ██    ║'
    puts '║ ██░░░░░░░░░░██      ██    ▓▓▓▓▓▓▓▓░░▓▓██░░████    ██      ║'
    puts '║ ██░░░░░░░░░░██    ██░░░░██▓▓▓▓▓▓▓▓░░▓▓██████    ████      ║'
    puts '║ ██░░░░░░░░░░██  ████████░░░░▓▓▓▓░░██░░▓▓██    ██░░░░██    ║'
    puts '║ ██░░░░░░░░░░░░██████████████░░░░██████░░██  ██░░░░░░██    ║'
    puts '║ ██░░░░░░░░░░████  ████████████████████▓▓██░░░░░░░░██      ║'
    puts '║ ██░░░░░░░░░░██  ████░░░░░░░░░░░░░░░░░░████░░░░░░░░██      ║'
    puts '║ ██░░░░░░░░██      ██████████████████    ██░░░░██          ║'
    puts '║ ██░░░░██      ████████      ██░░██      ████              ║'
    puts '║ ████        ██░░██          ████                          ║'
    puts '║               ██                                          ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end

  def success
    header
    puts '║                   Successful Operation                    ║'
    puts '╚═══════════════════════════════════════════════════════════╝'
  end
end
