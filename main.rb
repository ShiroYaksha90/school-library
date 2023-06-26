require_relative 'app'
require_relative 'user_input.rb'
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

def main
  app = App.new
  actions=Input.new
  loop do
    options
    num = gets.chomp
    break if num == '7'

    actions.user_input(app, num)
  end
  p 'Thanks for using the app, goodbye'
end

main
