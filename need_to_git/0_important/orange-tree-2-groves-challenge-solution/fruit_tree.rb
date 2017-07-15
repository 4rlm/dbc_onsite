require 'pry'

class FruitTree

  attr_accessor :age, :height, :harvested

  def initialize(args = {})
    @age = args.fetch(:age, 0)
    @height = args.fetch(:height, 0)
    @harvested = []
  end

  def pass_growing_season
    self.harvested = []
    self.age += 1
    self.height += self.class::HEIGHT_INCREASE
    if self.mature? && !self.dead?
      rand(self.class::QUANTITY).times { harvested << self.class::CREATE_FRUIT.call #self.class.bear_fruit}
    end
  end

  def has_fruit?
    !harvested.empty?
  end

  def mature?
    age >= self.class::MATURE_AGE
  end

  def dead?
    age >= self.class::DEAD_AGE
  end

  def pick_a_fruit
    raise self.class::ERROR, self.class::ERROR_MESSAGE unless self.has_fruit?
    picked_fruit = harvested.sample
    harvested.delete(picked_fruit)
  end

end