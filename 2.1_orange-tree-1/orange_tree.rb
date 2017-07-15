# require 'pry'

class OrangeTree
  attr_reader :age, :height, :has_oranges

  def initialize
    @age = 0
    @height = 0
    @has_oranges = nil
  end


  # Define a custom exception class
  class NoOrangesError < StandardError
    def initialize
      raise NoOrangesError.new("This tree has no oranges")
    end
  end


  def dead?
    if @age >= 100
      true
    else
      false
    end

  end

  def grow_tree
    if @height <= 25
      @height+=2.5
    else
      @height
    end
  end

  def add_age
    @age+=1
  end

  # Returns true if the tree is old enough to bear fruit (6), false otherwise
  def mature?
    if @age >= 6
      true
    else
      false
    end
  end

  def bear_fruit
    if mature?
      harvested = (100..300).to_a.sample
      # puts harvested.inspect
    else
      0
    end
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
    unless @has_oranges == false
      @has_oranges
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  # raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?
  def pick_an_orange
    if has_oranges?
      get_oranges = Orange.new
    else
      no_oranges_error = NoOrangesError.new
    end
  end

  def pass_growing_season
    @has_oranges = false
    self.grow_tree
    self.add_age
    self.bear_fruit
  end

end


######## Runner ########

# tree = OrangeTree.new
# puts tree.pass_growing_season
# puts tree.has_oranges?
