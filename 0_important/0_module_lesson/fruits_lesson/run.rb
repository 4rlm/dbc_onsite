require 'pry'

module ParserModule
  def self.parse(text_file)
    raw_results = []
    final_array = []

    File.open(text_file, 'r') do |file_string|
      file_string.each_line do |line|
        raw_results << line
      end
    end

    raw_results.map! do |str|
      row = str[0..-2]
      final_array << Model.new(row.split(', '))
    end

    final_array
  end

end
####################
class Model
  attr_reader :name, :color, :taste
  def initialize(args = {})
    @name = args[0]
    @color = args[1]
    @taste = args[2]
  end
end
####################
class Controller
  def run
    text_file = './fruit_data.txt'
    fruits = ParserModule.parse(text_file)

    fruits = fruits.map do |fruit|
       "#{fruit.name.capitalize} are #{fruit.color} and taste #{fruit.taste}."
    end
    fruits
  end
end
###########################################

controller = Controller.new
p controller.run
