module BookLabelHandlers
  def list_all_books
    @books.each_with_index do |book, index|
      if @books.any?
        puts "#{index}) name: #{book.name}, publisher:
        #{book.publisher}, published_year:#{book.publish_date} coverstate: #{book.cover_state}"
      else
        puts 'You have not added any books yet'.upcase
      end
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
    book = Book.new(name: name, cover_state: cover_state, publisher: publisher, publish_date: publish_date)
    @books << book
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
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "#{index}) Title: #{label.title}, Color: #{label.color}" if @labels.any?
      puts 'You have not added any labels yet'.upcase
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
