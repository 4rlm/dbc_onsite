class Guessing_game
  VALID_Numbers = (1..100).to_a # Store valid answers in an array

  def initialize(answer)
    @answer = answer
    @number = 0
    @solved = false
    @response = nil

    if answer > 100
      raise RuntimeError.new("Answer must be between 1 and 100")
    end
  end

  def guess(number)
    @number = number
    if @number == @answer # Check if the two are equal
      @solved = true
      @response = :correct
    elsif @number > @answer # Check if the guess is higher
      @solved = false
      @response = :high
    elsif @number < @answer # Check if the guess is lower
      @solved = false
      @response = :low
    end

    puts say_message
    @response
  end

  def solved?
    @solved
  end

  def say_message
    case @response
    when :correct then "You got it!"
    when :high then "Too high!"
    when :low then "Too low!"
    end
  end

end

# game = Guessing_game.new(20)
# game.guess(10)
