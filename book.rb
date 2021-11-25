require_relative 'item'
class Book < Item
  attr_accessor :name, :publish_date, :cover_state, :publisher

  def initialize(publisher:, cover_state:, publish_date:, name: 'unknown', archived: false)
    super(publish_date: publish_date, archived: archived, name: name)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*args)
    {
      'JSON.create_id' => self.class.name,
      'name' => @name,
      'publisher' => @publisher,
      'publish_date' => @publish_date,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
