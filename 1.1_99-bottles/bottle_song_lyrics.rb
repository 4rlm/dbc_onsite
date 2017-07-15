# Takes as its input an integer +n+ representing the starting number of bottles.
# Returns the lyrics to "n Bottles of Beer".

def starting_msg(n)
  "#{n} bottles of beer on the wall, #{n} bottles of beer."
end

def middle_msg(n)
  "Take one down, pass it around, #{n} bottles of beer on the wall!\n\n"
end

def ending_msg
  "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down, pass it around, no more bottles of beer on the wall!\n\n"
end

def bottle_song_lyrics(n)
  # "The lyrics to #{n} Bottles of Beer"

  while n > 1
    puts starting_msg(n)
    n-=1
    puts middle_msg(n)
  end

  puts ending_msg

end
