require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    (Time.now.year - @last_played_at.year) > 2
  end

  private :can_be_archived?

  def to_s
    "[GAME] Multiplayer: #{multiplayer}, Last played at: #{@last_played_at.strftime('%Y/%m/%d %k:%M')}, #{super}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.merge(super).to_json(*args)
  end

  def self.json_create(obj)
    game = new(obj['multiplayer'], obj['last_played_at'], Time.parse(obj['publish_date']))
    game.id = obj['id']
    game
  end
end
