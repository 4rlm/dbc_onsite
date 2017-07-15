require 'pry'

module FileParser
  def self.parse(text_file)
    array_of_qa = []
    final_array = []
    File.open(text_file) do |file_string|
        file_string.each_line do |line|
          if line =~ /\w+/
          array_of_qa << line.chomp
          end
        end
    end
    while array_of_qa.length > 0
      pair = array_of_qa.slice!(0..1)
      headers = [:question, :answer]
      final_array << Card.new(headers.zip(pair).to_h)
    end
    final_array
  end
end

class Card
  attr_reader :question, :answer

  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
    # @input = args[:input]
  end
end

# class Deck
#   def initialize(deck)
#     @deck = deck
#   end
# end

class FlashcardView

  def greeting
    puts "Welcome to the Flashcard game!"
  end

  def display_question(question)
    puts "#{question}"
    user_input = gets.chomp
  end

  def display_answer(ans)
    puts "#{ans}!"
  end

  def display_score(score, length)
    puts "You got #{score} out of #{length} right!"
  end

end

class FlashcardController
  attr_reader :score

  def initialize
    @score = 0
  end

  def score
    @score += 1
  end

  def run
    text_file = 'raccoon_flashcard_data.txt'
    cards_array = FileParser.parse(text_file)
    view = FlashcardView.new
    controller = FlashcardController.new

    cards_array.each do |card|
      user_input = view.display_question(card.question)
      if user_input.downcase == card.answer.downcase
        self.score
        view.display_answer("Right")
      else
        view.display_answer("Wrong! The answer was #{card.answer}")
      end
    end
    view.display_score(@score, cards_array.length)
  end

end

controller = FlashcardController.new
controller.run


