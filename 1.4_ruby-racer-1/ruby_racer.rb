class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die, length = 30)
    @players = players
    @die = die # Die Class's object
    @length = length
    @moves_a = 0
    @moves_b = 0
    @winner = nil
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    if @moves_a >= 30 && @moves_b < 30
      @winner = players.first
    elsif @moves_b >= 30 && @moves_a < 30
      @winner = players.last
    elsif @moves_a >= 30 && @moves_b >= 30
      @winner = players.join(', ')
    else
      nil
    end

    if @winner
      true
    else
      false
    end

  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    @winner

  end

  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    moves = die.roll # 1 to 6

    case player
    when @players.first then @moves_a += moves
    when @players.last then @moves_b += moves
    end
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    puts "Score: #{@moves_a}:  #{@moves_b}"

    insert_player(@moves_a, players.first.to_s)
    insert_player(@moves_b, players.last.to_s)
  end

  def insert_player(moves, player)
    bars = []
    32.times { bars << ' | ' }

    bars.insert(moves, player)
    puts bars.join
  end
end
