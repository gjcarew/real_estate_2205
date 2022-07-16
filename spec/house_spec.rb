require './lib/room'
require './lib/house'

RSpec.describe 'Iteration 4' do

  before :each do
    @house = House.new("$400000", "123 sugar lane")
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
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    @house.add_room(room_1)
    @house.add_room(room_2)

    expect(@house.rooms).to eq([room_1, room_2])

  end
end
