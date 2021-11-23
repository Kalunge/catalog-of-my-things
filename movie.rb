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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'publish_date' => @publish_date,
      'silet' => @silet,
      'archived' => @archived
    }.to_json(*args)
  end

  private :can_be_archived?
end
