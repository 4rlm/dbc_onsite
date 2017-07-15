# def straight_line_include?(word, puzzle)
# end
#
# def snaking_include?(word, puzzle)
# end
############################################

puzzle = [
  ["a", "w", "o", "l", "v", "e", "s"],
  ["s", "o", "a", "w", "a", "h", "p"],
  ["i", "t", "c", "k", "e", "t", "n"],
  ["o", "t", "s", "d", "h", "o", "h"],
  ["s", "e", "h", "g", "s", "t", "a"],
  ["u", "r", "p", "i", "w", "e", "u"],
  ["z", "s", "b", "n", "u", "i", "r"]
]

########################################

def coordinate_finder(puzzle, first_letter)
  coords = []
  r = 0
  for i in 0..puzzle.length
    row = puzzle[i]
    if row && row.include?(first_letter)
      col = row.index(first_letter)
      coords << [r, col]
    end
    r+=1
  end
  coords
end

def get_neighbors(array, coords)
  row_num = coords[0]
  col_num = coords[1]

  top = array[row_num-1][col_num-1..col_num+1]
  mid = array[row_num][col_num-1..col_num+1]
  bot = array[row_num+1][col_num-1..col_num+1]

  neighbors = {
    top: top,
    mid: mid,
    bot: bot
  }
end

def puzzle_starter(puzzle, word)
  found = []
  first_letter = word[0]
  puts "\n\nSearching for first letter '#{first_letter}' in '#{word}'..."
  coords = coordinate_finder(puzzle, first_letter)

  if coords
    puts "Found '#{first_letter}' in coords: #{coords}\n\n"
    found << first_letter

    for i in 1..word.length-1
      next_letter = word[i]
      puts "Searching for next letter '#{next_letter}' surrounding '#{word[i-1]}' ..."

      coords.each do |coord|
        neighbors = get_neighbors(puzzle, coord)

        neighbors.each do |k,v|
          if v.include?(next_letter)
            found << next_letter
            puts "Found #{next_letter} in #{v}"
          end
        end

      end

    end


  else
    puts "Can't find '#{first_letter}' in the puzzle."
  end

  puts found.uniq!.inspect
end

word = "wolves"
puzzle_starter(puzzle, word)
