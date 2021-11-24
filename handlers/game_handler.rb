require 'json'
require './game'
require './author'

class GamesHandler
  attr_accessor :games

  def initialize()
    @games = []
    @authors = []
  end

  def add_game
    print 'Game name: '
    name = gets.chomp.to_s

    print 'Enter Author firstname: '
    first_name = gets.chomp

    print 'Enter author lastname: '
    last_name = gets.chomp

    print 'Published Date: '
    publish_date = gets.chomp
    print 'Is multiplayer [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y'
    print 'Last played on [YYYY-MM-DD]: '
    last_played_at = gets.chomp

    author = Author.new(first_name, last_name)
    game = Game.new(publish_date: publish_date, name: name, multiplayer: multiplayer, last_played_at: last_played_at)
    author.add_item(game)
    @authors.push(author)
    @games.push(game)

    puts
    puts('Successfully added game!')
    puts
  end

  def all_games
    if @games.empty?
      puts 'Sorry! Right now we have no games'
    else
      puts 'All games are: '
      puts
      @games.each do |game|
        puts "Title: '#{game.name}', Published_Date: #{game.publish_date}, Multiplayer: #{game.multiplayer},
        ID: #{game.id}"
      end
      puts
    end
  end

  def all_authors
    if @authors.any?
      puts
      puts 'All authors are: '
      @authors.each do |author|
        puts "ID: '#{author.id}', Name: #{author.first_name} #{author.last_name}"
      end
      puts
    else
      puts 'Sorry! We have no authors detail'
    end
  end

  def save_games
    File.open('games.json', 'w') { |file| file.write JSON.generate(@games) } unless @games.empty?
  end
 
  def save_author
    File.open('authors.json', 'w') { |file| file.write JSON.generate(@authors) } unless @authors.empty?
  end

  def load_games_from_files
    file = 'games.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |game|
        new_game = Game.new(publish_date: game['publish_date'], name: game['name'], multiplayer: game['multiplayer'],
                            last_played_at: game['last_played_at'])
        new_game.id = game['id']
        @games << new_game
      end
    else
      []
    end
  end

  def load_authors_from_files
    file = 'authors.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |authors|
        new_author = Author.new(first_name: authors['first_name'], last_name: authors['last_name'])
        new_author.id = authors['id']
        @authors << new_author
      end
    else
      []
    end
  end
end
