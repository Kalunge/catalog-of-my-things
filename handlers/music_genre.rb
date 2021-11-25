require 'json'
require_relative '../music_album'
require_relative '../genre'
# rubocop:disable Metrics

module MusicGenreHandlers
  def list_all_music_album
    if @music_album.length.zero?
      puts 'Sorry! There is not Music album yet!'.upcase
    else
      puts "List of all Music albums: \n"
      @music_album.each_with_index do |album, index|
        puts "#{index} - Album: #{album.name}, Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
      end
    end
  end

  def create_genre
    print 'Genre name: '
    genre = gets.chomp
    Genre.new(genre)
  end

  def handle_genre
    if @genre.any?
      print "enter 'N' to create a new genre or 'S' to select an existing one: "
      option = gets.chomp.upcase
      case option
      when 'N'
        create_genre
      when 'S'
        puts 'select a label from the list by index'
        list_all_genre
        option = gets.chomp
        @genre[option.to_i]
      else
        print 'invalid entry'
      end
    else
      create_genre
    end
  end

  def add_music_album
    puts

    print 'Music album name: '
    music_name = gets.chomp

    print 'Published date: '
    publish_date = gets.chomp

    print 'On spotify? [Y/N]: '
    on_spotify = gets.chomp != 'n'

    print 'Archived? [Y/N]: '
    archived = gets.chomp != 'n'

    music = MusicAlbum.new(publish_date: publish_date, name: music_name, archived: archived, on_spotify: on_spotify)
    genre = handle_genre
    genre.add_item(music)
    @music_album << music
    @genre << genre unless @genre.include?(genre)

    puts
    puts 'Music album is created succussfully!'
    puts
  end

  def load_musics_from_file
    if File.exist?('music_album.json')
      JSON.parse(File.read('music_album.json')).map do |music|
        music_name = music['name']
        publish_date = music['publish_date']
        on_spotify = music['on_spotify']
        archived = music['archived']
        new_music = MusicAlbum.new(publish_date: publish_date, name: music_name, archived: archived,
                                   on_spotify: on_spotify)
        @music_album << new_music
      end
    else
      []
    end
  end

  def save_music
    File.open('music_album.json', 'w') { |file| file.write JSON.generate(@music_album) } unless @music_album.empty?
  end

  def add_genre
    print 'Genre: '
    genre = gets.chomp
    genre = Genre.new(genre)
    @genre << genre
    puts 'Genre has been added successfully'
  end

  def list_all_genre
    puts
    if @genre.length.zero?
      puts 'Sorry! There is no genre yet!'.upcase
    else
      puts "List of all genre: \n"
      @genre.each_with_index do |genre, index|
        puts "#{index} - Genre: #{genre.name}"
      end
    end
  end

  def load_genres_from_file
    if File.exist?('genre.json')
      JSON.parse(File.read('genre.json')).map do |genre|
        name = genre['name']
        new_genre = Genre.new(name)
        new_genre.items = genre['items']
        @genre << new_genre
      end
    else
      []
    end
  end

  def save_genre
    File.open('genre.json', 'w') { |file| file.write JSON.generate(@genre) } unless @genre.empty?
  end
end
# rubocop:enable Metrics
