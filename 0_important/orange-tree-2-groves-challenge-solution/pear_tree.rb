require_relative 'fruit_tree.rb'
require_relative 'pear'

class PearTree < FruitTree
  # Define a custom exception class
  class NoPearsError < StandardError
  end

  MATURE_AGE = 5
  DEAD_AGE = 40
  ERROR = NoPearsError
  ERROR_MESSAGE = "This tree has no pears"
  QUANTITY = (175..225)
  HEIGHT_INCREASE = 2.5
  CREATE_FRUIT =  Proc.new {Pear.new}

end