require'./lib/room'

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(cat)
    @rooms.select {|room| room.category == cat }
  end

  def area
    area = 0
    rooms.each{|room| area += room.area}
    area
  end

  def details
    {"price" => @price, "address" => @address}
  end



end
