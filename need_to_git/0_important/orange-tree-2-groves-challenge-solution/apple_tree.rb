require_relative 'fruit_tree'
require_relative 'apple'

class AppleTree < FruitTree
  # Define a custom exception class
  class NoApplesError < StandardError
  end

  MATURE_AGE = 5
  DEAD_AGE = 45
  ERROR = NoApplesError
  ERROR_MESSAGE = "This tree has no apples"
  QUANTITY = (400..600)
  HEIGHT_INCREASE = 2
  CREATE_FRUIT =  Proc.new {Apple.new}

end