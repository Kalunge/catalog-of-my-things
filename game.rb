require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :name, :publish_date

  def initialize(publish_date:, name: 'Unknown', archived: false, last_played_at: nil, multiplayer: false)
    super(publish_date: publish_date, archived: archived, name: name)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end

  private :can_be_archived?

  def to_s
    "[GAME] Multiplayer: #{multiplayer}, Last played at: #{@last_played_at.strftime('%Y/%m/%d %k:%M')}, #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'multiplayer' => @multiplayer,
      'published_date' => @publish_date.strftime('%Y/%m/%d %k:%M'),
      'last_played_at' => @last_played_at
    }.merge(super).to_json(*args)
  end

  def self.json_create(obj)
    game = new(obj['name'], obj['multiplayer'], obj['published_date'], obj['last_played_at'])
    game.id = obj['id']
    game
  end
end
