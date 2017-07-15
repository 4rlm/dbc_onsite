require 'csv'
require_relative 'recipe.rb'
require 'pry'

class RecipeBook

  attr_accessor :recipes

  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    CSV.foreach( filename, headers: true, header_converters: :symbol) do |row|
      self.recipes << Recipe.new(row.to_hash)
    end

    @recipes

  end

  def get_recipe
    @recipes.each do |recipe|
      puts "\n\nID: #{recipe.id}\nName: #{recipe.name}\nDescription: #{recipe.description}\nIngredients: #{recipe.ingredients}\nDirections: #{recipe.directions}\n\n"
    end
  end

  def find_recipe_by_id(recipe_id)
    each_recipe = []
    @recipes.each do |recipe|
      each_recipe << recipe if recipe.id == recipe_id
    end

    if each_recipe.empty?
      raise "Can't find a recipe with an id of #{recipe_id.inspect}"
    end

    each_recipe
  end

end


recipe_book = RecipeBook.new
recipe_book.load_recipes('recipes.csv')
p recipe_book.find_recipe_by_id('111')
