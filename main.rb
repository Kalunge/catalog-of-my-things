require_relative './handlers/movie_handler'
require_relative 'handlers/book_label_handler'
require_relative 'handlers/music_genre'
# rubocop:disable Metrics

class App
  include(BookLabelHandlers)
  include MusicGenreHandlers
  def initialize
    @movie_handler = MovieHandler.new
    @books = []
    @labels = []
    @music_album = []
    @genre = []

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
    load_books_from_file
    load_labels_from_file
    load_musics_from_file
    load_genres_from_file

    @movie_handler.load_movies_from_files
    @movie_handler.load_sources_from_files
    puts 'Welcome to the Catalog Of My Things! '
    puts ''
    puts 'Please choose an option by entering a number.'
    print 'enter option: '
    puts
    loop do
      @options.each { |key, value| puts "\t #{key}) #{value}" }

      option = gets.chomp
      break if option == '13'

      handle_option option
    end
    save_books
    save_labels
    save_music
    save_genre
  end

  def handle_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_music_album
    when '3'
      @movie_handler.all_movie
    when '4'
      puts 'List of games'
    when '5'
      list_all_genre
    when '6'
      list_all_labels
    when '7'
      puts 'List all authors'
    when '8'
      @movie_handler.all_soucrce
    when '9'
      add_book
    when '10'
      puts add_music_album
    when '11'
      @movie_handler.add_movie
    when '12'
      puts 'Add a game'
    else
      puts 'That is not a valid option'
    end
  end
end

def main
  app = App.new
  app.run
end
# rubocop:enable Metrics
main
