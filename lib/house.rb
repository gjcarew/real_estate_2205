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

  def price_per_square_foot
    (@price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by{|room| -room.area}
  end

  def rooms_by_category
    cats = @rooms.map{|room| room.category}.uniq
    rbc_hash = Hash.new()
    cats.each do |cat|
      rbc_hash[cat] = rooms_from_category(cat)
    end
    rbc_hash
  end

end
