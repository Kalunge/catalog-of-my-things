require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, archived: false, on_spotify: true)
    super(publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  private :can_be_archived?
end

