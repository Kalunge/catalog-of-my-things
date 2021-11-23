require_relative '../movie'
require_relative '../source'

class Movie_Handler
    attr_accessor :movie
    def initialize()
        @movies= []
        @sources = [] 
    end

    def add_movie
        print 'Movie name: '
        name = gets.chomp
        print 'Movie Source: '
        source_name= gets.chomp
        print 'Published Date: '
        publish_date = gets.chomp
        print 'Silet? [Y/N]: '
        silet = gets.chomp != 'n'
        print 'Archived: '
        archived = gets.chomp != 'n'

        @sources.push(Source.new(source_name))
        @movies.push(Movie.new(publish_date: publish_date, silet: silet, archived: archived, name: name))
        puts('Successfully added movie!')
        choice_selection
    end

    def all_movie
        puts 'All movies are: '
        @movies.each { |movie| puts "Title: '#{movie.name}', Published_Date: #{movie.publish_date}, Silet: #{movie.silet}, ID: #{movie.id}" }
        choice_selection
    end

    def all_soucrce
        puts 'All sources are: '
        @sources.each { |source| puts "Name: '#{source.name}', ID: #{source.id}" }
        choice_selection
    end

    def choice_selection
        puts 'Please Choose an option by entrin a number:'
        choose_options = ['1- Add movie',  '2- List of movies', '3- List all sources', '4-Exit']
        choose_options.map { |choose| puts choose }
        options = gets.chomp.to_i
        case options
        when 1
            add_movie
        when 2
            all_movie
        when 3
            all_soucrce
        else
            puts 'Thanks for using this app!'
        end
    end
end

def main
    puts 'Welcome Movie App!'
    puts
    test = Movie_Handler.new
    test.choice_selection
end

puts(main)