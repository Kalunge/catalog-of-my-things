module BookLabelHandlers
  def list_all_books
    @books.each_with_index do |book, index|
      if @books.any?
        puts "#{index}) name: #{book.name}, publisher:
        #{book.publisher}, published_year:#{book.publish_date} coverstate: #{book.cover_state}"
      end
      puts 'You have not added any books yet'.upcase
    end
    start
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "#{index}) Title: #{label.title}, Color: #{label.color}" if @labels.any?
      puts 'You have not added any labels yet'.upcase
      start
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
    message
  end
end
