require_relative '../game'
# require_relative '../item'

describe '#test_game' do
  before :each do
    @game = Game.new(publish_date: '1992-1-1', name: 'Super Mario Bros', multiplayer: true, last_played_at: '2000-1-1')
    @game.id = Random.rand(1...1000)
    @game.multiplayer = true
  end

  describe '#instance' do
    it 'is an instance of Game' do
      expect(@game).to be_instance_of(Game)
    end
  end

  describe '#archive?' do
    it 'can be archived' do
      expect(@game.archived).to be_falsey
    end
  end

  describe '#multiplayer' do
    it 'can be played in multiplayer' do
      expect(@game.multiplayer).to be_truthy
    end
  end

  describe '#to_s' do
    it 'returns a string' do
      expect(@game.to_s).to be_instance_of(String)
    end
  end

  describe '#id' do
    it 'returns an id' do
      expect(@game.id).to be_instance_of(Integer)
    end

    it 'id is an int between 1 and 1000' do
      expect(@game.id).to be_between(1, 1000)
    end
  end
end
