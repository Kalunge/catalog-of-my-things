require './item'

class Movie < Item
  def initialize(publish_date:, silet:, archived: false, name: 'unknown')
    super(publish_date: publish_date, archived: archived, name: name)
    @silet = silet
  end

  def can_be_archived?
    super() || @silet
  end
end
test = Movie.new(publish_date: '2020-10-10', silet: false, archived: true)
p test
p test.can_be_archived?
