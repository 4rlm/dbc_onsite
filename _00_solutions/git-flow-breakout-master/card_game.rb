class CardGame

  attr_accessor :players

  def initialize(deck, players=["Joel", "Garrett"])
    @deck = deck
    @players = players
  end

  # TODO 
  def draw_card
  	@deck[4]
  end

end