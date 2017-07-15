class Oven
  def add_batch(batch)
    @batch = batch
    @batch.each do |cookie|
      cookie.check_status
    end
  end

  def add_time
    @batch.each do |cookie|
      cookie.current_bake_time += 5
    end
  end

  def check_status_all
    @batch.each do |cookie|
      cookie.check_status
    end
  end

  def remove_batch
    @batch.each do |cookie|
      if cookie.status == :done || cookie.status == :burned
        @batch.delete(cookie)
      end
    end
  end

  def current_batch
    @batch.map { |cookie| cookie.class::FLAVOR }
  end
end
