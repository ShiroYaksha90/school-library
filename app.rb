require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'rentals'

class App
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_all_books
    p '#=> No books added yet' if books.empty?
    books.each do |book|
      p "#=> Title: #{book.title} Author: #{book.author}"
    end
  end

  def list_people
    p '#=> no person added yet' if people.empty?
    people.each do |person|
      p "#=> [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_student
    print 'Age: '
    age = Integer(gets.chomp)
    print 'Name: '
    name = gets.chomp
    print 'Parent permission? [y/n]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      people << Student.new(nil, age, name, parent_permission: false)
    when 'y'
      people << Student.new(nil, age, name)
    else
      'Invalid option, please try again'
    end
    p '#=> Student created successfully'
  end

  def create_teacher
    print "Teacher's specialization: "
    specialization = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    people << teacher
    p '#=> Teacher created successfully'
  end

  def create_person
    p 'What type of person do you want to create?'
    p '(1) Student'
    p '(2) Teacher'
    print 'Input number: '
    person_type = Integer(gets.chomp)
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    p '#=> Book created successfully'
  end

  def create_rental
    return if books.empty? || people.empty?

    p 'Select a book from the following list by number'

    books.each.with_index(1) do |book, index|
      p "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    print 'Choose a book: '
    selected_book = Integer(gets.chomp) - 1
    p '#=> Select a person from the folllowing list by number (no id)'
    people.each.with_index(1) do |person, index|
      p "#{index}) Name: #{person.name} Age: #{person.age} ID: #{person.id}"
    end
    print 'Choose a person'
    selected_person = Integer(gets.chomp) - 1
    print 'Date: '
    selected_date = gets.chomp.to_s
    rentals << Rental.new(selected_date, books[selected_book], people[selected_person])
    p '#=> Rental created successfully'
  end

  def list_rentals
    print 'Enter the person ID: '
    id = gets.chomp.to_i
    rentals.each do |rental|
      if rental.person.id == id
        p "#=> Date: #{rental.date}, Book: #{rental.book.title} Author: #{rental.book.author}"
      else
        p 'Invalid id, please try again'
      end
    end
  end
end
