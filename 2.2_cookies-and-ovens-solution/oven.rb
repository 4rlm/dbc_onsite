# require_relative 'cookie'

class Oven
  attr_reader :rack, :on, :temp
  def initialize
    @rack = []
    @on = false
    @temp = 0
  end

  def add_batch(items)
    items.each do |item|
      @rack << item
    end
  end

  def check_batch
    # return array of true/false based on cookies
    status = {}
    self.rack.each do |item|
      status[item.type] = item.status
    end
    status
  end

  def bake_batch(time)
    return false if !on? #The oven needs to be on
    time.times do
      self.rack.each do |item|
        item.bake
      end
    end
  end

  def remove_batch(type = 'all')
    # REFACTOR to allow to remove specific cookies
    batch = []
    if type != 'all'
      batch = select_batch(type)
      @rack -= batch
    else
      batch = self.rack
      @rack = []
    end
    batch
  end

  def select_batch(type)
    self.rack.select { |item| item.type == type }
  end

#Not yet implemented
  def turn_on(temp)
    @on = true
    @temp = temp
  end

  def turn_off
    @on = false
    @temp = 0
  end

  def on?
    @on
  end
end
