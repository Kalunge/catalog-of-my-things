class Label
  def initialize(title:, color:)
    @id = Random.rand(1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
