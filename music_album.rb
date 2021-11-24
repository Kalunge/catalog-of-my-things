require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, name: 'unknown', archived: false, on_spotify: true)
    super(publish_date: publish_date, name: name, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  def to_json(*args)
    {
      'JSON.create_id' => self.class.name,
      'name' => @name,
      'publish_date' => @publish_date,
      'on_spotify' => @publisher,
      'archived' => @archived
    }.to_json(*args)
  end

  private :can_be_archived?
end
