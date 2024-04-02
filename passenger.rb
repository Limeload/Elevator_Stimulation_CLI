class Passenger
  attr_reader :name, :destination_floor

  def initialize(name, destination_floor)
    @name = name
    @destination_floor = destination_floor
  end
end
