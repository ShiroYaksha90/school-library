require_relative 'app.rb'
class Render < App
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