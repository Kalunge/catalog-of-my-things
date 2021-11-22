class App
  def initialize
    @options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movie',
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

    loop do
      @options.each { |key, value| puts "#{key}) #{value}" }

      option = gets.chomp
      break if option == '13'
    end
  end
end

def main
  app = App.new
  app.run
end

main
