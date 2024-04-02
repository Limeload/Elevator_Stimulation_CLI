require_relative 'elevator'
require_relative 'floor'
require_relative 'passenger'

class Main
  def initialize
    @elevator = Elevator.new
    @floors = []
    setup_floors(10) # Change 10 to desired number of floors
  end

  def setup_floors(num_floors)
    num_floors.times { |i| @floors << Floor.new(i + 1) }
  end

  def start
    loop do
      print_menu
      choice = gets.chomp.to_i
      case choice
      when 1
        call_elevator
      when 2
        puts "Exiting..."
        break
      else
        puts "Invalid choice, please try again."
      end
    end
  end

  def print_menu
    puts "\nElevator Simulation"
    puts "1. Call elevator"
    puts "2. Exit"
    print "Enter your choice: "
  end

  def call_elevator
    print "Enter floor number to go to: "
    floor_number = gets.chomp.to_i
    if floor_number.between?(1, @floors.length)
      @elevator.move_to(floor_number)
      simulate_elevator_trip(floor_number)
    else
      puts "Invalid floor number."
    end
  end

  def simulate_elevator_trip(destination_floor)
    passengers = generate_passengers
    passengers.each { |passenger| @elevator.add_passenger(passenger) }

    # Move elevator to destination floor
    @elevator.move_to(destination_floor)

    passengers.each { |passenger| @elevator.drop_passenger(passenger) }
  end

  def generate_passengers
    passengers = []
    num_passengers = rand(1..5) # Randomly generate 1 to 5 passengers
    num_passengers.times do |i|
      passenger = Passenger.new("Passenger #{i+1}", rand(1..@floors.length))
      passengers << passenger
    end
    passengers
  end
end

main = Main.new
main.start
