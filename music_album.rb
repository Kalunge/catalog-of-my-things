require_relative './item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify
  attr_reader :archived

  def initialize(publish_date, archived, on_spotify: false)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end
end
