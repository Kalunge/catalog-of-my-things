require 'json'
require_relative '../book'
require_relative '../label'
module BookLabelHandlers
  def list_all_books
    if @books.empty?
      puts 'You have not added any books yet'.upcase
    else
      @books.each_with_index do |book, index|
        puts "#{index}) name: #{book.name}, publisher: #{book.publisher}, publish_date:#{book.publish_date}"
      end
      puts
    end
  end

  def create_label
    print 'label title: '
    title = gets.chomp
    print 'label color: '
    color = gets.chomp
    Label.new(title: title, color: color)
  end

  def handle_label
    if @labels.any?
      print "enter 'N' to create a new label or 'S' to select an existing one"
      option = gets.chomp.upcase
      case option
      when 'N'
        create_label
      when 'S'
        puts 'select a label from the list by index'
        list_all_labels
        option = gets.chomp
        @labels[option.to_i]
      else
        print 'invalid entry'
      end
    else
      create_label
    end
  end

  def add_book
    print 'name: '
    name = gets.chomp
    print 'publisher: '
    publisher = gets.chomp
    print 'date of publish: '
    publish_date = gets.chomp
    print 'cover state: '
    cover_state = gets.chomp
    # option = gets.chomp
    # print 'label title: '
    # title = gets.chomp
    # print 'label color: '
    # color = gets.chomp

    # label = Label.new(title: title, color: color)
    label = handle_label
    book = Book.new(name: name, cover_state: cover_state, publisher: publisher, publish_date: publish_date)
    label.add_item(book)
    @labels << label
    @books << book
    puts 'Book added successfully'
  end

  def load_books_from_file
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).map do |book|
        name = book['name']
        publisher = book['publisher']
        publish_date = book['published_date']
        cover_state = book['cover_state']
        new_book = Book.new(name: name, publisher: publisher, publish_date: publish_date, cover_state: cover_state)
        @books << new_book
      end
    else
      []
    end
  end

  def save_books
    File.open('books.json', 'w') { |file| file.write JSON.generate(@books) } unless @books.empty?
  end

  def add_label
    print 'title: '
    title = gets.chomp
    print 'color: '
    color = gets.chomp
    label = Label.new(title: title, color: color)
    @labels << label
    puts 'label added successfully'
  end

  def list_all_labels
    if @labels.empty?
      puts 'You have not added any labels yet'.upcase
    else
      @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title}, Color: #{label.color}" }
    end
  end

  def load_labels_from_file
    if File.exist?('labels.json')
      JSON.parse(File.read('labels.json')).map do |label|
        title = label['title']
        color = label['color']
        new_label = Label.new(title: title, color: color)
        @labels << new_label
      end
    else
      []
    end
  end

  def save_labels
    File.open('labels.json', 'w') { |file| file.write JSON.generate(@labels) } unless @labels.empty?
  end
end
