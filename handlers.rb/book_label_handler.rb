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


end
