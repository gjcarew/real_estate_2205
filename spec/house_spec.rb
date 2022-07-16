require './lib/room'
require './lib/house'

RSpec.describe 'Iteration 4' do

  before :each do
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  it 'exists' do
    expect(@house).to be_an_instance_of(House)
  end

  it 'has a price' do
    expect(@house.price).to eq(400000)
  end

  it 'has an address' do
    expect(@house.address).to eq("123 sugar lane")
  end

  it 'initializes without rooms' do
    expect(@house.rooms).to be_empty
  end

  it 'can add rooms' do

    @house.add_room(@room_1)
    @house.add_room(@room_2)

    expect(@house.rooms).to eq([@room_1, @room_2])
  end

  it 'can tell if a house is above market average' do
    expect(@house.above_market_average?).to be(false)
  end

  it 'can filter rooms by category' do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
    expect(@house.rooms_from_category(:basement)).to eq([@room_4])
  end

  it 'can calculate whole house area' do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    expect(@house.area).to eq(1900)
  end

  it 'can return details (hash of attributes)' do
    expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
  end

  it 'can calculate price per square foot' do
    expect(@house.price_per_square_foot).to eq(210.53)
  end

  xit 'can sort rooms by area' do
    expect(@house.rooms_sorted_by_area).to eq([@room_4, @room_3, @room_2, @room_1])
  end

  xit 'can return rooms by category hash'
    expect(@house.rooms_by_category).to eq({:bedroom=>[@room_1, @room2], :living_room=>[@room_3], :basement=>[@room_4]})
  end
end
