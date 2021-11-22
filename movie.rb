require './item'

class Movie < Item
  def initialize(publish_date, silet, archived: false)
    super(publish_date, archived)
    @silet = silet
  end

  def can_be_archived?
    super() || silet
  end
end
