require_relative 'fruit_tree'
require_relative 'orange'

class OrangeTree < FruitTree
  # Define a custom exception class

  class NoOrangesError < StandardError
  end

  MATURE_AGE = 6
  DEAD_AGE = 100
  ERROR = NoOrangesError
  ERROR_MESSAGE = "This tree has no oranges"
  QUANTITY = (100..300)
  HEIGHT_INCREASE = 2.5
  CREATE_FRUIT =  Proc.new {Orange.new}
  # def self.bear_fruit
  #   Orange.new
  # end
end