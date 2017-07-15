class Cookie
  attr_accessor :current_bake_time, :status

  def initialize
    @current_bake_time = 0
    @status = :doughy
  end

  def check_status
    if current_bake_time == self.class::MAX_BAKE_TIME
      @status = :done
      puts "#{self.class::FLAVOR} cookie is done!"
    elsif current_bake_time < self.class::MAX_BAKE_TIME
      puts "#{self.class::FLAVOR} cookie is doughy."
    elsif current_bake_time > self.class::MAX_BAKE_TIME
      @status = :burned
      puts "#{self.class::FLAVOR} cookie is burned."
    end
  end
end
