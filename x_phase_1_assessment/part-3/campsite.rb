class Campsite
  attr_reader :location, :square_footage
  attr_accessor :assigned_employee

  def initialize(args = {})
    @location = args.fetch(:location) { "unassigned" }
    @square_footage = args.fetch(:square_footage) { 2000 }
    @power = args.fetch(:power) { false }
    @water = args.fetch(:water) { false }
  end

  def powered?
    @power
  end

  def water?
    @water
  end

  def reserve
    @reserved = true
  end

  def end_reservation
    @reserved = false
  end

  def reserved?
    @reserved
  end

  def available?
    !reserved?
  end

  def assigned?
    !!@assigned_employee
  end
end
