class Station
  def initialize
    @capacity = 5
  end

  def bikes
    @bikes ||= []
  end

  def release(bike = nil)
    bikes.delete(bike)
  end

  def bike_count
    bikes.count
  end

  def full?
    bike_count == @capacity
  end

  def dock(bike)
    raise 'Station full.' if full?
    bikes << bike
  end

  def available_bikes
    bikes.reject{ |bike| bike.broken?}
  end

  def broken_bikes
    bikes.select{ |bike| bike.broken?}
  end
end
