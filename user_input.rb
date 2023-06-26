require_relative 'app.rb'
class Input
    # app = App.new
    def user_input(app,num)
        case num
        when '1'
          app.list_all_books
        when '2'
          app.list_people
        when '3'
          app.create_person
        when '4'
          app.create_book
        when '5'
          app.create_rental
        when '6'
          app.list_rentals
        else
          p 'Invalid option, please try again'
        end
      end
end