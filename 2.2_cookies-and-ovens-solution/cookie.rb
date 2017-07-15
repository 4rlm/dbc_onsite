# Cookie Class
class Cookie

  COOKIE_TYPE = 'generic'
  MAX_BAKE_TIME = 10

  attr_reader :type, :status, :max_bake_time, :current_bake_time

  def initialize(args = {})
    @type = self.class::COOKIE_TYPE
    @current_bake_time = args.fetch(:baked_time, 0)
    @max_bake_time = self.class::MAX_BAKE_TIME
    @status = :doughy
    update_status
  end

  def bake
    @current_bake_time += 1
    update_status
  end

  def cooked?
    @status == :ready || @status == :burned
  end

  def update_status
    case self.current_bake_time

    when 0..(self.max_bake_time-2)
      @status = :doughy

    when (self.max_bake_time-2)..(self.max_bake_time-1)
      @status = :almost_ready

    when self.max_bake_time..(self.max_bake_time+2)
      @status = :ready

    else
      @status = :burned
    end
  end
end
