require_relative 'segment'
# require 'pry'

class RoadTrip
  attr_accessor :name, :segments
  # attr_reader :segments

  def initialize(args = {})
    @name = args[:name]
    @segments = args[:segments]
  end

  def add_segment(new_segment)
    @segments << new_segment
  end

  def total_miles
    miles = 0
    @segments.each do |seg|
      miles += seg.miles
    end
    miles
  end

  def average_miles_per_segment
    seg_count = @segments.length
    ave_miles = total_miles / seg_count
    ave_miles
  end

end

###########  Runner ################

seg1 = Segment.new(miles: 500)
seg2 = Segment.new(miles: 750)
segments = [seg1, seg2]
trip = RoadTrip.new(name: 'Trip to SF', segments: segments)
# puts trip.inspect
# trip.add_segment(miles: 200)
# puts trip.inspect
puts trip.total_miles





# sf = RoadTrip.new('Trip to SF')
# puts sf.inspect
