## https://learnrubythehardway.org/book/ex40.html

##### Step 1 - Modules Are Like Hashes #####

## A) Hash Form
# mystuff = {'apple' => "I AM APPLES!"}
# puts mystuff['apple']

## B) Hash converted to Module
module MyStuff
    def MyStuff.apple()
        "I AM APPLES!"
    end
end

# require "./mystuff.rb"
MyStuff.apple()

##### Step 2 - Adding Constant #####
# module MyStuff
#     def MyStuff.apple()
#         "I AM APPLES!"
#     end
#
#     # this is just a variable
#     TANGERINE = "Living reflection of a dream"
# end

# require "./mystuff.rb"
# MyStuff.apple()
# puts MyStuff::TANGERINE

##### Step 3 - Comparisons #####
# p mystuff['apple'] # get apple from dict
# p MyStuff.apple() # get apple from the module
# p MyStuff::TANGERINE # same thing, it's just a variable

##### Step 4 - Pattern #####
## 1) Take a key=value style container.
## 2) Get something out of it by the key's name.

##### Step 5 - Classes Are Like Modules #####
class MyStuff
  def initialize()
      @tangerine = "And now a thousand years between"
  end

  attr_reader :tangerine

  def apple()
      puts "I AM CLASSY APPLES!"
  end
end

# thing = MyStuff.new()
# thing.apple()
# puts thing.tangerine

##### Step 6 - 3 Ways to Get Things from Things #####
## 1) dict style
# mystuff['apples']

## 2) module style
# MyStuff.apples()
# puts MyStuff::TANGERINE

## 3) class style
# thing = MyStuff.new()
# thing.apples()
# puts thing.tangerine
