require 'json'
require './movie'
require './source'

class MovieHandler
  attr_accessor :movie

  def initialize()
    @movies = []
    @sources = []
  end

  def add_movie
    puts
    print 'Movie name: '
    name = gets.chomp
    print 'Source: '
    source_name = gets.chomp
    print 'Published Date: '
    publish_date = gets.chomp
    print 'Silet? [Y/N]: '
    silet = gets.chomp != 'n'
    print 'Archived? [Y/N]: '
    archived = gets.chomp != 'n'

    @sources.push(Source.new(source_name))
    @movies.push(Movie.new(publish_date: publish_date, silet: silet, archived: archived, name: name))
    puts
    puts('Successfully added movie!')
    puts
  end

  def all_movie
    if @movies.empty?
      puts 'Sorry! Right now we have no movies'
    else
      puts 'All movies are: '
      puts
      @movies.each do |movie|
        puts "Title: '#{movie.name}', Published_Date: #{movie.publish_date}, Silet: #{movie.silet}, ID: #{movie.id}"
      end
      puts
    end
  end

  def all_soucrce
    if @sources.any?
      puts
      puts 'All sources are: '
      @sources.each { |source| puts "ID: #{source.id}, Name: '#{source.name}'" }
      puts
    else
      puts 'Sorry! We have no sources detail'
    end
  end

  def save_movies
    File.open('movies.json', 'w') {|file| file.write JSON.generate(@movies)} unless @movies.empty?
  end

  def save_sources
    File.open('sources.json', 'w') {|file| file.write JSON.generate(@sources)} unless @sources.empty?
  end

  def load_movies_from_files
    file = 'movies.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |movie|
        new_movie = Movie.new(publish_date: movie['publish_date'], silet: movie['silet'], archived: movie['archived'], name: movie['name'])
        new_movie.id = movie['id']
        @movies.push(new_movie)
      end
    else
      []
    end
  end

  def load_sources_from_files
    file = 'sources.json'

    if File.exist? file
      JSON.parse(File.read(file)).map do |source|
        new_source = Source.new(source['name'])
        new_source.id = source['id']
        @sources.push(new_source)
      end
    else
      []
    end
  end
end
