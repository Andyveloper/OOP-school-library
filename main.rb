require_relative './school_person'
require_relative './school_student'
require_relative './school_teacher'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './classroom'
require_relative './book'
require_relative './rental'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

math_classroom = Classroom.new('Math')
english_classroom2 = Classroom.new('English')

hans_student = Student.new(15, math_classroom, 'Hans')
hans_student.add_classroom(math_classroom)
hans_student.add_classroom(english_classroom2)

lotr = Book.new('Lord of the Ring', 'Tolkien')
harry_p = Book.new('Harry Potter', 'JK Rowling')
chris_person = Person.new(25, 'Chris')

chris_person.add_rental('2022-12-01', lotr)
chris_person.add_rental('2022-12-01', harry_p)
chris_person.rentals
# p student.classroom.label
hans_student.add_rental('2022-12-01', harry_p)
p hans_student.rentals[0].book.title
p hans_student
