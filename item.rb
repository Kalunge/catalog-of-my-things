require 'date'

class Item
  # attr_reader 
  attr_accessor :id, :archived, :source, :publish_date, :name, :genre, :author, :label

  def initialize(publish_date:, name:, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @name = name
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    today = Date.today
    (today.year - @publish_date.year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private :can_be_archived?
end
