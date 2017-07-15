class IncidentReport
  attr_reader :description, :reporter
  attr_accessor :assigned_employee

  def initialize(args = {})
    @description = args.fetch(:description) { "not specified" }
    @reporter = args.fetch(:reporter) { "anonymous" }
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

