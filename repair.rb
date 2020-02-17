class Van
  def initialize
    @storage = 3
  end

  def workshop
    @workshop ||= []
  end

  def workshop_full?
    workshop.count == @storage
  end

  def send_to_repair(station)
    while station.broken_bikes != []
      raise 'Workshop full.' if workshop_full?
      workshop << station.broken_bikes.first
      station.release(station.broken_bikes.first)
    end
  end

  def finish_repair(station)
    workshop.each{|bike| bike.fix!}
    while workshop != []
      raise 'Station full.' if station.full?
      station.bikes << workshop.first
      workshop.delete(workshop.first)
    end
  end

end
