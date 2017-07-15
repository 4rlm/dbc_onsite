# Get input from the user:  the cheer

def call_out_cheer
  puts "Shout your cheer: \nRED HOT \nDO IT AGAIN \n2 BITS \nSTOMP YOUR FEET"
  cheer = gets.chomp
  mascot_sign_for(cheer)
  cheer
end

# Determine the mascot's response based on the argument
# passed to the method
def mascot_sign_for(cheer)
  response = nil
  case cheer
  when "RED HOT"
    response = "H-O-T!"
  when "DO IT AGAIN"
    response = "Go, Fight, Win"
  when "2 BITS"
    response = "Holler!"
  when "STOMP YOUR FEET"
    response = "STOMP!"
  else
    response = "Go Team!"
  end
  display(response)
  response
end

# Print the argument passed to the method
def display(response)
  puts ""
  puts response
  coordinate_cheers
end

# This method will control the flow of the application,
# making use of the other three methods.
def coordinate_cheers
  counter = 0
  until counter == 2
    puts "If you want to keep cheering, type YES. Otherwise, type GAME OVER."
    input = gets.chomp
    if input == "YES"
      call_out_cheer
      counter = 2
    elsif input == "GAME OVER"
      puts "Goodbye!"
      counter = 2
    else
      puts "Thats not a valid reponse! Try again."
      counter += 1
    end
  end
end

call_out_cheer

# promt user to continue cheering
# if they say yes, it loops back to the call_out_cheer method and restarts the process
# if they say no, then its the same as saying 'game over'
# if they hit enter twice then it ends the game
