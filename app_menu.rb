require_relative 'glob_handler'

class App
  include(BookLabelHandlers)
  include MusicGenreHandlers
  def initialize
    @movie_handler = MovieHandler.new
    @game_handler = GamesHandler.new
    arr_init
    @options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List of games',
      '5' => 'List all genres',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all source',
      '9' => 'Add an Item',
      '10' => 'Exit'
    }
  end

  def run
    book_load
    music_load
    movies_load
    game_load
    print_o
    loop do
      @options.each { |key, value| puts "\t #{key}) #{value}" }

      option = gets.chomp
      break if option == '10'

      handle_option option
    end
    save_books
    save_labels
    save_music
    save_genre
    @game_handler.save_author
    @game_handler.save_games
    @movie_handler.save_movies
    @movie_handler.save_sources
  end

  def print_o
    puts 'Welcome to the Catalog Of My Things! '
    puts ''
    puts 'Please choose an option by entering a number.'
    print 'enter option: '
    puts
  end

  def arr_init
    @books = []
    @labels = []
    @music_album = []
    @genre = []
  end

  def game_opts
    @game_handler.add_game
  end

  def movie_opts
    @movie_handler.add_movie
  end

  def book_load
    load_books_from_file
    load_labels_from_file
  end

  def music_load
    load_musics_from_file
    load_genres_from_file
  end

  def movies_load
    @movie_handler.load_movies_from_files
    @movie_handler.load_sources_from_files
  end

  def game_load
    @game_handler.load_games_from_files
    @game_handler.load_authors_from_files
  end

  def add_list
    @add_menu = {
      '1' => 'Add a book',
      '2' => 'Add a music album',
      '3' => 'Add a movie',
      '4' => 'Add a game',
      '5' => 'Go Back'
    }
  end

  def add_opts
    add_list
    @add_menu.each { |key, value| puts "\t #{key}) #{value}" }
    print 'enter option: '
    option = gets.chomp
    case option
    when '1'
      add_book
    when '2'
      add_music_album
    when '3'
      movie_opts
    when '4'
      game_opts
    when '5'
      run
    else
      puts 'invalid option'
    end
  end

  # rubocop:disable Metrics
  def handle_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_music_album
    when '3'
      @movie_handler.all_movie
    when '4'
      @game_handler.all_games
    when '5'
      list_all_genre
    when '6'
      list_all_labels
    when '7'
      @game_handler.all_authors
    when '8'
      @movie_handler.all_soucrce
    when '9'
      add_opts
    else
      puts 'That is not a valid option'
    end
  end
  # rubocop:enable Metrics
end
