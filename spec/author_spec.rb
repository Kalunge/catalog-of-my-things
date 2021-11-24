require_relative '../author'
require_relative '../item'

describe Author do
  before :each do
    @author = Author.new('author_firstname', 'author_lastname')
    @author.id = Random.rand(1..1000)
  end

  describe '#names' do
    it 'should return author firstname' do
      expect(@author.first_name).to eq('author_firstname')
    end

    it 'should return author lastname' do
      expect(@author.last_name).to eq('author_lastname')
    end
  end

  describe '#add_item' do
    it 'should add item to @items' do
      @item = Item.new(name: 'item_name', publish_date: '2011-1-1')
      @author.add_item(@item)
      expect(@author.items).to include(@item)
    end
  end

  describe '#id' do
    it 'returns an id' do
      expect(@author.id).to be_instance_of(Integer)
    end

    it 'id is an int between 1 and 1000' do
      expect(@author.id).to be_between(1, 1000)
    end
  end
end
