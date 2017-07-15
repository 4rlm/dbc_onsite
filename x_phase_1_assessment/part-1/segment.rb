class Segment

  attr_reader :origin, :destination, :miles

  def initialize(args = {})
    @origin = args[:origin]
    @destination = args[:destination]
    @miles = args[:miles]
  end

end
