require_relative 'app'

def options
  p 'Welcome to school library App!'
  p 'Please choose an option by entering a number: ',
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all of rentals for a giver person id',
    '7 - Exit'
end

def selected_option(app, num)
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

def main
  app = App.new
  loop do
    options
    num = gets.chomp
    break if num == '7'

    selected_option(app, num)
  end
  p 'Thanks for using the app, goodbye'
end

main
