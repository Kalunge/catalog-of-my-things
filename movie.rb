require './item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date:, silet:, archived: false, name: 'unknown')
    super(publish_date: publish_date, archived: archived, name: name)
    @silet = silet
  end

  def can_be_archived?
    super() || @silet
  end

  private :can_be_archived?
end
