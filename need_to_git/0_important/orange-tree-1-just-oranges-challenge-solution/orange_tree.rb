class OrangeTree

  attr_reader :age, :height, :oranges
  # Define a custom exception class
  class NoOrangesError < StandardError
  end

  def initialize
    @age = 0
    @height = 0
    @oranges = []
  end

  def pass_growing_season
    grow_older
    grow_taller
    bear_fruit
  end

  # Returns true if the tree is old enough to bear fruit (6), false otherwise
  def mature?
    self.age > 5
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
    self.oranges.count > 0
  end

  def dead?
    self.age > 99
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?

    # orange-picking logic goes here
    picked_orange = self.oranges.sample
    self.oranges.delete(picked_orange)
  end

  private

  attr_writer :age, :height

  def grow_older
    self.age = self.age + 1
  end

  def grow_taller
    self.height = self.height + 2.5
  end

  def bear_fruit
    if self.mature?
      (100..300).to_a.sample.times do 
        self.oranges << Orange.new
      end
    end
  end
end