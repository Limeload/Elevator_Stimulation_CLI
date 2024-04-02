class Passenger
  attr_reader :name, :selected_floor, :exited_floor

  def initialize(name, selected_floor, exited_floor)
    @name = name
    @selected_floor = selected_floor
    @exited_floor = exited_floor
  end
end
