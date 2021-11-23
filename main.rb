require_relative 'handlers/book_label_handler'
class App
  include(BookLabelHandlers)
  def initialize
    @books = []
    @labels = []
    @options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List of games',
      '5' => 'List all genres',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all source',
      '9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game',
      '13' => 'Exit'
    }
  end

  def run
    puts 'Welcome to the Catalog Of My Things! '
    puts ''
    puts 'Please choose an option by entering a number.'
    print 'enter option: '
    loop do
      @options.each { |key, value| puts "\t #{key}) #{value}" }

      option = gets.chomp
      save_books and break if option == '13'

      handle_option option
    end
  end

  def handle_option(option)
    list_all_books if option == '1'
    add_book if option == '9'
    list_all_labels if option == '6'
  end
end

def main
  app = App.new
  app.run
end

main
