
module Parser
end

class Card
  attr_reader :question, :answer
  def initialize(args = {})
    @question = args[:question]
    @question = args[:answer]
  end
end

class Deck
end

class View
  def greeting
  end

  def display_question(question)
  end


end

class Controller
end
