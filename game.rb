require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :name, :publish_date

  def initialize(publish_date:, last_played_at:, name: 'Unknown', archived: false, multiplayer: false)
    super(publish_date: publish_date, archived: archived, name: name)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end

  private :can_be_archived?

  def to_s
    "[GAME] Multiplayer: #{multiplayer}, Last played at: #{@last_played_at}"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'id' => @id,
      'multiplayer' => @multiplayer,
      'publish_date' => @publish_date,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end
end
