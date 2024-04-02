class Elevator
  attr_accessor :current_floor, :passengers

  def initialize(current_floor = 1)
    @current_floor = current_floor
    @passengers = []
  end

  def move_to(floor_number)
    puts "Moving from floor #{@current_floor} to floor #{floor_number}..."
    @current_floor = floor_number
    puts "Arrived at floor #{floor_number}."
  end

  def add_passenger(passenger)
    @passengers << passenger
    puts "#{passenger.name} has entered the elevator."
  end

  def drop_passenger(passenger)
    @passengers.delete(passenger)
    puts "#{passenger.name} has exited the elevator at floor #{passenger.exited_floor}."
  end
end
