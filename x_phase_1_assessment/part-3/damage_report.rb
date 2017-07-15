class DamageReport
  attr_reader :description, :cost_estimate
  attr_accessor :assigned_employee

  def initialize(args = {})
    @description = args.fetch(:description) { "not specified" }
    @cost_estimate = args[:cost_estimate]
    @resolved = false
  end

  def resolved?
    !!@resolved
  end

  def close
    @resolved = true
  end

  def assigned?
    !!@assigned_employee
  end
end
