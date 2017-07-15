# Solo Warm-up Challenge

## Directions
Read carefully. By now, you understand that reading technical documents is hard. It's also a skill required of software engineers, and you can practice this during this challenge. We've made these instructions as clear as we know how, and need you to demonstrate your attention to detail and commitment to quality by meeting the requirements below. If something is confusing, *ask*. 

  - You should do this challenge solo.
  - You should clone this repo and make a branch for your work. Commit Often!.
  - You should write your code in the file `runner.rb`.
  - Anything that isn't Ruby code should be in comments.
  - You may use Google, books, and other resources for help, but do your own work.
  - Do not copy and paste code that you do not understand.
  - When you're finished, do a final commit and push your branch to github.
  - Write tests, like this: `p my_method(input) == 'expected outcome'`. This `puts` a happy `true` to the console when the method is returning the expected outcome. *We have given you examples!* Use those examples and expand write more that include the edge cases you can think of. Write tests before you write code and execute the tests continuously while coding.
  - Include *all driver code and tests* in your submission. Your runner.rb file will ideally be error-free Ruby that puts lots of `true` when run.
  - If you run into issues completing this work, ask any instructor for help.

## Exercise 1

Define two local variables: `first_name` and `last_name`, and assign them the values of your own names.

## Exercise 2

Use `#each` to write a method called `calculate_product` which takes as its input an array of integers and returns their product.  For example

```ruby
puts calculate_product([1,2,3]) == 6 # this test puts 'true' if calculate_product([1,2,3]) returns the correct value of 6
puts calculate_product([0,-1,-10]) == 0 
puts calculate_product([1,-1,-10]) == 10 
puts calculate_product([]) == nil
```
Your solution should use `each`, not an `enumerable` method. If you would prefer to write this with an enumerable, note which method(s) you'd use in a comment. 

## Exercise 3

Explain in plain English what each of these methods does and the value each returns.  Ensure your answer is written as a comment. You may want to look up the syntax for multi-line comments. 

```ruby
def format_name(name)
  return "#{name[:last]}, #{name[:first]}"
end

def display_name(name)
  puts format_name(name)
end
```

## Exercise 4

Write a method `find_missing_number` that returns the number missing in a list of sequential numbers from 1 to 10,000.  Your method's input will be a comma-separated string (e.g., "1, 2, 3, etc.").  There will only be one missing number.

```ruby
string_missing_7    = (1..10000).reject { |x| x == 7 }.join(",")
string_missing_4567 = (1..10000).reject { |x| x == 4567 }.join(",")
string_missing_9999 = (1..10000).reject { |x| x == 9999 }.join(",")


puts find_missing_number(string_missing_7) == 7         
puts find_missing_number(string_missing_4567) == 4567
puts find_missing_number(string_missing_9999) == 9999
```
What are the most difficult missing numbers to detect? Write tests for those.

## Exercise 5

Define a `House` class, and model the behavior of a house.  Each house should have its own state, meaning that I can create many different instances of the House class, each with its own unique property values.

  * Each house has its own `current_temp` (e.g. 67).
  * Each house has its own `minimum_temp` and `maximum_temp` (e.g., 62 and 70, respectively). Your client wants exactly these variable names. 
  * Each house has its own `heater_on` and `ac_on` status (true if on, false if off).
  * The `heater_on` and `ac_on` properties are set to `false` when a house is instantiated.
  * The House `initialize` method accepts three arguments: a current temp, a minimum temp, and a maximum temp.
  * The House `initialize` method throws an `ArgumentError` if more or less than three arguments are passed.
  * Calling `toggle_heater` on an instance of House turns the heater on/off.
  * Calling `toggle_ac` turns the air conditioner on/off.
  * Only the heater or the air conditioner will be on at any given time, never both.
  * Calling `update_temp!` increases or decreases the current temperature depending on if the heater or the air conditioner is on.
  * When the heater is on, `update_temp!` increases the `current_temp` by 1 unit.
  * When the air conditioner is on, `update_temp!` decreases the `current_temp` by 2 units.
  * When the `current_temp` rises above the `maximum_temp`, the air conditioner turns on and the heater should be off.
  * When the `current_temp` falls below the `minimum_temp`, the heater turns on and the air conditioner should be off.
  
You will need to write driver code like this -- `my_house = House.new(75, 60, 80)` -- before you can test your code.
