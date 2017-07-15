# EXERCISE 1

# <Your code here>
first_name = 'Adam'
last_name = 'Booth'

greeting = "My name is #{first_name} #{last_name}."
puts greeting


# EXERCISE 2

def calculate_product(array)

  sum = 0
  product = 0
  array.each do |num|
    sum = sum + num
  end
  return sum

end

puts calculate_product([1,2,3]) == 6


# EXERCISE 3

#This method returns first and last names using string interpolation via a hash.  The output in my case would be "Booth, Adam"
# def format_name(name)
#   return "#{name[:last]}, #{name[:first]}"
# end

#This method simply returns the name via the arguments and parameters when calling the function.  It would simply return "Adam"
# def display_name(name)
#   puts format_name(name)
# end




# EXERCISE 4

# <Your code here>




# EXERCISE 5

class House

  def initialize(current_temp, minimum_temp, maximum_temp)
    @current_temp = current_temp
    @minimum_temp = minimum_temp
    @maximum_temp = maximum_temp
    @heater_on = false
    @ac_on = false
  end

  def heater_on
    @heater_on = true
    @ac_on = false
    puts "Heater On"
    auto_temp
  end

  def ac_on
    @ac_on = true
    @heater_off = false
    puts "AC On"
    auto_temp
  end

  def toggle_heater
    if @heater_on == false
      @heater_on = true
      @ac_on = false
      puts "Status: Heater turned On"
      auto_temp
    elsif @heater_on == true
      @heater_on = false
      puts "Status: Heater turned Off"
      auto_temp
    end

    if @ac_on == false
      @ac_on = true
      @heater_on = false
      puts "Status: AC turned On"
      auto_temp
    elsif @ac_on == true
      @ac_on = false
      puts "Status: AC turned Off"
      auto_temp
    end
  end

  def update_temp!
    puts "Current Temp: #{@current_temp}."
    if @heater_on == true
      @current_temp = @current_temp + 1
      auto_temp
    elsif @ac_on == true
      @current_temp = @current_temp - 2
      auto_temp
    end
    puts "New Temp: #{@current_temp}."
  end

  def auto_temp
    if @minimum_temp == @current_temp
      puts "Minimum Temperature Reached!"
      toggle_heater
    elsif @maximum_temp == @current_temp
      puts "Maximum Temperature Reached!"
      toggle_heater
    end
  end

end

my_house = House.new(75,60,80)
my_house.heater_on
my_house.ac_on
my_house.toggle_heater
