require_relative '../label'
require_relative '../item'

describe 'Label' do
  before :each do
    @label = Label.new(title: 'movie', color: 'blue')
    @item = Item.new(name: 'karate', publish_date: '2011-12-2', archived: false)
  end

  describe '#new' do
    it 'has items as an empty array' do
      expect(@label.items).to be_empty
    end
    it 'is an instance of Label' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'adds an item to items' do
      @label.add_item(@item)
      expect(@label.items[0]).to be(@item)
    end
  end
end
