require 'csv'

module TextParser
  def self.parse(text_file)
    results = []
    File.open(text_file, 'r').each_line do |line|
      results << line
    end
    results.map! do |string|
      string[0..-2].split(', ')
    end
  end
end

module CsvParser
  def self.parse(data_file)
    results = []
    CSV.open(data_file, 'a+').each do |line|
      results << line
    end
    results
  end
end

class FruitModel
  attr_reader :name, :color, :taste
  def initialize(args = [])
    @name = args[0]
    @color = args[1]
    @taste = args[2]
  end

  def self.file_importer(data_file)
    if data_file.include?('.txt')
      puts "TextParser...."
      TextParser.parse(data_file).map do |arr|
        FruitModel.new(arr)
      end
    elsif data_file.include?('.csv')
      puts "CsvParser...."
      CsvParser.parse(data_file).map do |arr|
        FruitModel.new(arr)
      end
    end
  end
end

class FruitsController
  def run
    text_file = './fruit_data.txt'
    text_file = './fruit_data.csv'

    fruits = FruitModel.file_importer(text_file)
    FruitViewer.printer(fruits)
  end
end

class FruitViewer
  def self.printer(fruits)
    fruits = fruits.map do |fruit|
       "#{fruit.name.capitalize} are #{fruit.color} and taste #{fruit.taste}."
    end
    puts fruits
  end
end

####### Runner #####
controller = FruitsController.new
controller.run
