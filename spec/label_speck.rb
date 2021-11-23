require_relative '../label'
require_relative '../item'

describe 'Label' do
  before :each do
    label = Label.new(title: 'movue', color: 'blue')
    item = Item.new()
  end

  describe 'add_item' do
    it 'adds an item to items' do
      label.add_item(2)
      expect(label.items).to include(2)
    end
  end
end
