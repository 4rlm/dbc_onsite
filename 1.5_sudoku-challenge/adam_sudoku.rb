
###### PART 1: GAME BOARDS FORMATTING - START ######
string = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--
--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3
29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9
-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-
6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--
---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----
-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--
-96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7
----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----
3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--
3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-
-2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-
--7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--
----------2-65-------18--4--9----6-4-3---57-------------------73------9----------
---------------------------------------------------------------------------------"

################

## Converts original 15-game string to 15 strings in one array.
def str_to_games(str)
  games = str.scan(/.{81}/)
  games
end

## Calls the method and assigns results to "games".
games = str_to_games(string)

###############

## Converts 1 of 15 game strings into 9x9 arrays for one game.
def row_formatter(game)
  els = game.chars
  rows = els.each_slice(9).to_a
  rows
end

# rows_pure = row_formatter(games[13])
rows_pure = row_formatter(games[3])


rows = rows_pure

## Calls the method and assigns results to 'rows'
# puts "\n\nrows = #{rows}\n\n"  ## => Don't call here.  Should call inside methods below.

###############

# rows = row_recalculator(rows, replaced_dash)
# p rows

###############

## Converts current game into string from rows.  Call this method each time dashes are replaced with numbers in the rows.
def pretty_print(rows)
  pretty = rows.map {|a| a.join('  ')}
  pretty.map! {|a| a.insert(-1, "\n")}
  pretty
end

pretty = pretty_print(rows)
## Calls the pretty print method.
# pretty ## => Don't call here.  Should call inside methods below.

################

## Transposes 9x9 rows into 9x9 columns.
def col_formatter(rows)
  cols = rows[0..8].transpose.to_a
  cols
end

cols = col_formatter(rows)
## Calls the method and assigns results to 'cols'
# puts "\n\ncols = #{cols}\n\n"  ## => Don't call here.  Should call inside methods below.
###### PART 1: GAME BOARDS FORMATTING - END ######


###### PART 2: COORDINATE FINDER - START ######
## Finds coordinates for '-' intersecting rows and columns.
def coord_finder(rows)
  # boxes = []
  coords = []
  rows.each do |row|
    if row.include?('-')
      for col in 0...row.length
        if row[col] == '-'
          coords << [rows.index(row), col]
        end
      end
    end
  end
  coords
end

all_coords = coord_finder(rows)
## Calls method to get array of coordinates.
# p all_coords  ## => Don't call here.  Should call inside 'coordinate_caller(coords)' below.
###### PART 2: COORDINATE FINDER - END ######



###### PART 3: Box Array Generator and Coordinates Iterator - Start ######
## Two methods:  Creates Box Arrays and calls method to get the correct box array to be used in the filler method.

################

def box_array_maker(rows)
  ## Makes box arrays from rows.  Will be called each time parent rows array is updated (replacing '-' with number.)
  boxes = [[]] * 9
  boxes[0] = rows[0][0..2]+rows[1][0..2]+rows[2][0..2]
  boxes[1] = rows[0][3..5]+rows[1][3..5]+rows[2][3..5]
  boxes[2] = rows[0][6..8]+rows[1][6..8]+rows[2][6..8]
  boxes[3] = rows[3][0..2]+rows[4][0..2]+rows[5][0..2]
  boxes[4] = rows[3][3..5]+rows[4][3..5]+rows[5][3..5]
  boxes[5] = rows[3][6..8]+rows[4][6..8]+rows[5][6..8]
  boxes[6] = rows[6][0..2]+rows[7][0..2]+rows[8][0..2]
  boxes[7] = rows[6][3..5]+rows[7][3..5]+rows[8][3..5]
  boxes[8] = rows[6][6..8]+rows[7][6..8]+rows[8][6..8]
  boxes
end

boxes = box_array_maker(rows)
## Calls the boxes array maker method.
# p boxes  ## => Don't call here.  Should be called inside of box_array_caller(r,c,boxes) below.

################

def coordinates_iterator(all_coords, rows, cols, boxes)
  ## Data here is like a consolidator to send to other areas, primarily the filler below, which uses this data to determine which numbers are still available for the intersecting '-' (row, col, box).

  data = [] ## => data below shoveled in (order: coords, row, col, box)
  ri = nil ## => rows index number
  ci = nil ## => cols index number

  all_coords.each do |coords|
    ri = coords[0]
    ci = coords[1]

    if (0..2) === ri && (0..2) === ci
      data << [coords, rows[ri], cols[ci], boxes[0]]
    elsif (0..2) === ri && (3..5) === ci
      data << [coords, rows[ri], cols[ci], boxes[1]]
    elsif (0..2) === ri && (6..8) === ci
      data << [coords, rows[ri], cols[ci], boxes[2]]
    elsif (3..5) === ri && (0..2) === ci
      data << [coords, rows[ri], cols[ci], boxes[3]]
    elsif (3..5) === ri && (3..5) === ci
      data << [coords, rows[ri], cols[ci], boxes[4]]
    elsif (3..5) === ri && (6..8) === ci
      data << [coords, rows[ri], cols[ci], boxes[5]]
    elsif (6..8) === ri && (0..2) === ci
      data << [coords, rows[ri], cols[ci], boxes[6]]
    elsif (6..8) === ri && (3..5) === ci
      data << [coords, rows[ri], cols[ci], boxes[7]]
    elsif (6..8) === ri && (6..8) === ci
      data << [coords, rows[ri], cols[ci], boxes[8]]
    end
  end
  data
end

coords_data = coordinates_iterator(all_coords, rows, cols, boxes)
## Calls the method above.
# p coords_data ## =>  Don't call here.  Should be called inside filler(row, col, box) method's parameters below.
###### PART 3: Box Array Generator and Coordinates Iterator - END ######



###### PART 4: Fills-in the Game Board - START ######
## -TESTING VERSION- ##

# ---- Testing - Starts ###

# def prioritizer(all_avails) ## => Adds each dash's posibilities for entire game, then groups, and ranks them by frequency count.
#   all_avails = all_avails.concat(bank) ## => Adds bank to bank_uniques.
#
#   grouped_avails = all_avails.group_by{|e| e}.map{|k, v| [k, v.length]}.to_a  ## => Groups concats by quantity of each num.
#   sorted = grouped_avails.sort_by{|k|k[1]}  ## => Sorts denominations.
#   sorted.reverse! ## => Reverse sorts, so most frequently available nums used first.
#   p sorted
#
#   rank = []
#
#   i=0
#   for i in 0...sorted.length
#     rank << sorted[i][0]
#   end
#
#   p rank
# end

# ---- Testing - Ends ###



def bca_ranker(data) #
  bca = []  ## => 'bca' is short for 'bank_counts_array'.
  all = '1,2,3,4,5,6,7,8,9'.split(',')

  data.each do |d| ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
    filled = d[1]+d[2]+d[3] ## => adds row, col, and sqaure arrays.
    bank = all - filled  ## => subtracts nums filled nums from range of 1..9 to get unique nums available.
    bc = bank.count  ## => stores the count of available numbers for current dash.
    unless bc == 0
      bca << bc
    end
  end
  bca = bca.uniq.sort!
  bca[0]
end


def bca_ranker(data)
  bca = []  ## => 'bca' is short for 'bank_counts_array'.
  all = '1,2,3,4,5,6,7,8,9'.split(',')

  data.each do |d| ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
    filled = d[1]+d[2]+d[3] ## => adds row, col, and box arrays.
    bank = all - filled  ## => subtracts nums filled nums from range of 1..9 to get unique nums available.
    bc = bank.count  ## => stores the count of available numbers for current dash.
    unless bc == 0
      bca << bc
    end
  end
  bca = bca.uniq.sort!
  bca[0]
end


def dash_filler(replaced_dash, coords, bank, rows, cols)
  ### Method called inside if/elsif in evaluator, which replaces the dashes, then calls methods to recalculate the rows and cols.
  replaced_dash << [coords, bank[0]]
  rows[coords[0]][coords[1]] = bank[0]
  rows
  cols
end



def evaluator(data, rows, cols)
  ### Core logic of game: calls various methods to fill dashes in puzzle based on # of possible number options per dash.  Fills those with only one option first.  After all single option dashes are filled, it targets double options based on frequency count of available options elsewhere on the puzzle.
  ### 'data' is an array ordered by: coordinates, row, col, box.

  dash_count = coord_finder(rows).count
  puts "\n\n== Starting Puzzle =="
  puts pretty_print(rows)

  all = '1,2,3,4,5,6,7,8,9'.split(',')
  replaced_dash = []

  while dash_count != 0
    bca_ranker(data)

    puts "\n\n#{"="*25}\n\n"
    puts "Dashes: #{dash_count}"

    data.each do |d| ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
      filled = d[1]+d[2]+d[3] ## => adds row, col, and sqaure arrays.
      bank = all - filled  ## => subtracts nums filled nums from range of 1..9 to get unique nums available.
      # bc = bank.count  ## => stores the count of available numbers for current dash.
      # bca_rank = bca_ranker(data)

      if bank.count == bca_ranker(data)
        dash_filler(replaced_dash, d[0], bank, rows, cols)
        puts "BC: #{bank.count} / BCA: #{bca_ranker(data)} / Dashes: #{coord_finder(rows).count}\n\n"
      # else
        # puts "BC: #{bank.count} / BCA: #{bca_rank} / Dashes: #{coord_finder(rows).count}"
      end

    end
    puts pretty_print(rows)
    dash_count = coord_finder(rows).count
    puts "#{'-'*30}\n\n"
  end
end

evaluator(coords_data, rows, cols)



###### PART 4: Fills-in the Game Board - END ######


#
# ####### PART 4: Fills-in the Game Board - START ######
# ## - ORIGINAL -
#
# def dash_filler(replaced_dash, coords, bank, rows, cols)
#   ### Method called inside if/elsif in evaluator, which replaces the dashes, then calls methods to recalculate the rows and cols.
#   replaced_dash << [coords, bank[0]]
#   rows[coords[0]][coords[1]] = bank[0]
#   rows
#   cols
# end
#
# def evaluator(data, rows, cols)
#   ### Core logic of game: calls various methods to fill dashes in puzzle based on # of possible number options per dash.  Fills those with only one option first.  After all single option dashes are filled, it targets double options based on frequency count of available options elsewhere on the puzzle.
#   ### 'data' is an array ordered by: coordinates, row, col, box.
#
#   dash_count = coord_finder(rows).count
#   puts "\n\n== Starting Puzzle =="
#   puts pretty_print(rows)
#
#   all = '1,2,3,4,5,6,7,8,9'.split(',')
#   replaced_dash = []
#   all_avails = [] ## => Stores all possible options for entire game's dashes.
#
#   while dash_count != 0
#     puts "\n\n#{"="*25}\n\n"
#     puts "Dashes: #{dash_count}"
#
#     data.each do |d| ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
#       filled = d[1]+d[2]+d[3]
#       bank = all - filled
#
#       if bank.count == 1
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 2
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 3
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 4
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 5
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 6
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 7
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 8
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       elsif bank.count == 9
#         dash_filler(replaced_dash, d[0], bank, rows, cols)
#       end
#     end
#
#     ### 51 dashes.  1 = 3,
#
#     puts pretty_print(rows)
#     dash_count = coord_finder(rows).count
#     puts "Dashes: #{dash_count}"
#   end
# end
#
# evaluator(coords_data, rows, cols)

# ###### PART 4: Fills-in the Game Board - END ######








####### PART 4: Fills-in the Game Board - START ######
## - Simple Testing Version - 2 -

def dash_filler(replaced_dash, coords, bank, rows, cols)
  ### Method called inside if/elsif in evaluator, which replaces the dashes, then calls methods to recalculate the rows and cols.
  replaced_dash << [coords, bank[0]]
  rows[coords[0]][coords[1]] = bank[0]
  rows
  cols
end

def evaluator(data, rows, cols)
  ### Core logic of game: calls various methods to fill dashes in puzzle based on # of possible number options per dash.  Fills those with only one option first.  After all single option dashes are filled, it targets double options based on frequency count of available options elsewhere on the puzzle.
  ### 'data' is an array ordered by: coordinates, row, col, box.

  dash_count = coord_finder(rows).count
  # start_dash_count = coord_finder(rows).count
  puts "\n\n== Starting Puzzle =="
  puts pretty_print(rows)

  all = '1,2,3,4,5,6,7,8,9'.split(',')
  replaced_dash = []
  all_avails = [] ## => Stores all possible options for entire game's dashes.

  end_dash_count = 0
  start_dash_count = coord_finder(rows).count

  while dash_count != 0
    puts "\n\n#{"="*25}\n\n"
    puts "Dashes: #{dash_count}"


    data.each do |d| ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
      filled = d[1]+d[2]+d[3]
      bank = all - filled


      if bank.count == 1
        dash_filler(replaced_dash, d[0], bank, rows, cols)
      end

      # elsif bank.count == 2
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 3
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 4
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 5
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 6
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 7
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 8
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)
      # elsif bank.count == 9
      #   dash_filler(replaced_dash, d[0], bank, rows, cols)

    end

    ### 51 dashes.  1 = 3,

    end_dash_count = coord_finder(rows).count
    end_dash_count

    puts pretty_print(rows)
    dash_count = coord_finder(rows).count
    puts "Dashes: #{dash_count}"
  end
end

evaluator(coords_data, rows, cols)





####### NEED to DO: ###### (Not ordered by priority - just to-do list.)
## 1) Update original parent 9x9 game array.
## 2) Convert parent game array to pretty string for display.
## 3) Method to count avails, then decide to fill or pass.
## 4) Determine when game is over and score.
## 5) Menu to choose game number based on desired difficulty.
## 6) RSpec Tests
