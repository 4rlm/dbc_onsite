require 'pry'

class GumballMachineTerminalView
  def initialize

  end

  def welcome_message
    puts "Welcome to the Squirrel's Gumball Machine"
  end

  def gumball_prompt
    puts "Want a gumball? (y/n)"
    response = gets.chomp
  end

  def insert_coin_message
    puts "Please insert a coin for a gumball"
    puts "Your gumball is rolling out"
  end

  def release_gumball_message(gumball)
    puts "You got a #{gumball.color} gumball!!!"
  end

  def exit_message
    puts "Thank you, please come again :)"
  end
end


class Gumball
  attr_reader :color
  def initialize(args={})
    @color = args.fetch(:color, 'zebra')
  end
end

DEFAULT_COLORS = ['red', 'blue', 'yellow', 'unicorn', 'zebra']
DEFAULT_GUMBALLS = Array.new(50) { Gumball.new({color: DEFAULT_COLORS.sample})}

class GumballMachine
  attr_reader :gumballs, :coins

  def initialize(args={})
    @gumballs = args.fetch(:gumballs, DEFAULT_GUMBALLS)
    @coins = args.fetch(:coins, 0)
    # @capacity = args.fetch(:capacity, 100)
  end

  def refill(gumball_supply)
    @gumballs = @gumballs.concat(gumball_supply)
  end

  def cash_out
    amount = @coins
    @coins = 0
    amount
  end

  def insert_coin
    @coins += 1
    @gumballs.pop
  end
end

class GumballMachineController
  def initialize(terminal_view, gumball_machine)
    @view = terminal_view
    @machine = gumball_machine
  end

  def run
    loop do
      @view.welcome_message
      response = @view.gumball_prompt
      if response.downcase == 'y'
        @view.insert_coin_message
        gumball = @machine.insert_coin
        @view.release_gumball_message(gumball)
      else
        break
      end
    end
    @view.exit_message
  end
end

gumball_machine = GumballMachine.new
terminal_view = GumballMachineTerminalView.new
gumball_controller = GumballMachineController.new(terminal_view, gumball_machine)
gumball_controller.run
# View
# - Output
# - Input
#
# Controller
# - Connecting the View and Model
#
# Model
# - Encapsulating data
