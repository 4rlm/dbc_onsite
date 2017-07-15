

class Fruit # [Model] Data Design, Data manipulation, Data format, Data validation
  attr_accessor :list
  def initialize
    @list = {}
    # {name: "Adam", fruit: "apple"}
  end
end

class FruitsController # [Controller] work with view(html.erb files). Fetch data from DB and then prepare it for showing in view and sending data to the view.
  attr_accessor :fruit

  def initialize
    @fruit = Fruit.new
  end

  def speak(data) # data: a hash
    "\n<Fruits>\n#{data[:name]} likes #{data[:fruit]}."
  end
end

class FruitsView # [View] Showing thd data in a user-friendly way.
  def initialize
    @ctrl = FruitsController.new
  end

  def ask
    puts "What's your name?"
    name = gets.chomp
    puts "What's your favorite fruit?"
    fruit = gets.chomp

    @ctrl.fruit.list[:name] = name
    @ctrl.fruit.list[:fruit] = fruit

    puts @ctrl.speak(@ctrl.fruit.list)
  end
end
####### Runner ########

FruitsView.new.ask

# puts "adam"
# # (print) adam
# # (return) nil
#
# p "adam"
# # (print) adam
# # (return) "adam"
#
# puts ["adam", "gahee"]
# # (print) adam
# #         gahee
#
# puts ["adam", "gahee"].inspect
#
# # => ["adam", "gahee"]
