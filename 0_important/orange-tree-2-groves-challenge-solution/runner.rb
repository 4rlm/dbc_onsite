# Write the script to generate the report on 
# tree grove production here.
require_relative 'tree_grove'

#hard code grove
frans_grove = []
  5.times do
    frans_grove << AppleTree.new({age: 50})
  end
  10.times do
    frans_grove << AppleTree.new
    frans_grove << PearTree.new
    frans_grove << OrangeTree.new({age: 37})
    frans_grove << AppleTree.new({age: 5})
    frans_grove << PearTree.new({age: 20})
    frans_grove << PearTree.new({age: 50})
  end
  20.times do
    frans_grove << OrangeTree.new({age: 5})
    frans_grove << OrangeTree.new({age: 20})
    frans_grove << OrangeTree.new({age: 50})
    frans_grove << AppleTree.new({age: 20})
    frans_grove << AppleTree.new({age: 37})
    frans_grove << PearTree.new({age: 37})
  end

grove = TreeGrove.new(frans_grove)

years = 0

until years > 10
  p "Yield for year #{years}"
  grove.grove_growing_season
  years += 1
end