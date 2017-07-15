require 'csv'
# require_relative "person"

module FileParser  ## => Model
  def self.parse(data_file)
    array = []
    puts "Loading File parser ..."

    CSV.foreach(data_file, headers: true, header_converters: :symbol) do |row|
      p row
      array << Deck.new(row.to_hash)
    end
    array
  end
end


class Deck  ## => Model
  attr_reader :question, :answer

  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
    # @input = args[:input]
  end

end

class Card  ## => Model
  def initialize
    @deck = Deck.new
  end

end
