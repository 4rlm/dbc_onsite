# How to require and include files and methods from other areas.
# 'extend' vs 'include'

# include : mixes in specified module methods as instance methods in the target class

# extend : mixes in specified module methods as class methods in the target class

############
# selective class inheritance
# undef_method seems to work. According to the documentation...
# Prevents the current class from responding to calls to the named method. Contrast this with remove_method, which deletes the method from the particular class; Ruby will still search superclasses and mixed-in modules for a possible receiver.
# Link: https://stackoverflow.com/questions/18028846/ruby-selective-class-inheritance

############
require_relative 'ModuleName'

class Sample
  include ModuleName
end
############

module Reservable
  #copy redundant methods from classes into here.
end

module Fixable
  #copy redundant methods from classes into here.
end

class CampingItems
  # Parent Class, which includes two modules.
  include Reservable
  include Fixable

  # initialize not needed
end

class Tent < CampingItems
  # Child class, which accesses redundant methods from module via super class.
end

class WaterBottle < CampingItems
  # Child class, which accesses redundant methods from module via super class.
end

class SleepingBag < CampingItems
  # Child class, which accesses redundant methods from module via super class.
end


#################
