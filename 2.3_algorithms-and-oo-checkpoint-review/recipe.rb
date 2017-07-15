# require 'csv'
# require_relative 'recipe_book.rb'

class Recipe
  attr_accessor :id, :name, :description, :ingredients, :directions
  # I need to finish this before I give Bernie the program...
  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @description = args[:description]
    @ingredients = args[:ingredients]
    @directions = args[:directions]
  end

end
