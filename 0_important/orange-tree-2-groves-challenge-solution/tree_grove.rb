require_relative 'apple_tree'
require_relative 'pear_tree'
require_relative 'orange_tree'

class TreeGrove

  attr_reader :trees

  def initialize(trees)
    @trees = trees
  end

  def grove_growing_season
    apple_trees = trees.select {|apple_tree| apple_tree.class == AppleTree}
    total_apples = []
    apple_trees.each do |tree|
      tree.pass_growing_season
      total_apples << tree.harvested.length
    end
    p "Total Apples: #{total_apples.reduce(:+)}"

    orange_trees = trees.select {|orange_tree| orange_tree.class == OrangeTree}
    total_oranges = []
    orange_trees.each do |tree|
      tree.pass_growing_season
      total_oranges << tree.harvested.length
    end
    p "Total Oranges: #{total_oranges.reduce(:+)}"

    pear_trees = trees.select {|pear_tree| pear_tree.class == PearTree}
    total_pears = []
    pear_trees.each do |tree|
      tree.pass_growing_season
      total_pears << tree.harvested.length
    end
    p "Total Pears: #{total_pears.reduce(:+)}"

    # trees.each do |apple_tree|
    #   tree.pass_growing_season
    #   print_trees(tree.harvested)
    # end
  end

  def print_trees(harvest)
    apples = harvest.select {|apple| apple.class == Apple}
    p apples
  end
end