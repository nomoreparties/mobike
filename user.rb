class User
  def initialize(bike=nil)
    @bike = bike
    @hour_limit = 2
    @hours_rented = nil
    @rent_cost = 20
    @extra_fee_per_hour = 5
  end

  def has_bike?
    @bike != nil
  end

  def hour_limit
    @hour_limit
  end

  def rent_cost
    @rent_cost
  end

  def hours_rented
    @hours_rented
  end

  def extra_fee_per_hour
    @extra_fee_per_hour
  end

  def rent_bike(station)
    raise 'Cannot rent bike. Please return other bike first.' if has_bike?
    @bike = station.release(station.available_bikes.first)
    puts "Rent is RM#{rent_cost}. Return the bike in #{hour_limit} hours."
  end

  def return_bike(station, hours_rented)
    puts "Extra hours: #{hours_rented - hour_limit}"
    puts "Extra cost is RM#{(hours_rented - hour_limit) * extra_fee_per_hour}"
    puts "Your total cost: RM#{((hours_rented - hour_limit) * extra_fee_per_hour) + rent_cost}"
    @bike = station.dock(@bike)
    @bike = nil

  end
end
