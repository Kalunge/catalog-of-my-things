require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date:, last_played_at:, name: 'unknown', multiplayer: false)
    super(publish_date: publish_date, name: name)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
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
      'id' => @id,
      'name' => @name,
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end
end
