class Source
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end
end

test = Source.new(0, 'Horror')
# itemmm = Item.new(publish_date: '2020-10-10', archived: true)
# test.add_item(itemmm)
p test
