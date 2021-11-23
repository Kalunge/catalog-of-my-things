class Source
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end
end
