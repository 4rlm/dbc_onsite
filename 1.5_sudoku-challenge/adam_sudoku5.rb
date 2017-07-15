
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

## Converts original 15-game string to 15 strings in one array.
def str_to_games(str)
  games = str.scan(/.{81}/)
  games
end

## Calls the method and assigns results to "games".
games = str_to_games(string)

## Converts 1 of 15 game strings into 9x9 arrays for one game.
def row_formatter(game)
  els = game.chars
  rows = els.each_slice(9).to_a
  rows
end

#####################################################
# rows_pure = row_formatter(games[0])
# rows_pure = row_formatter(games[1])
# rows_pure = row_formatter(games[2])
# rows_pure = row_formatter(games[3])
# rows_pure = row_formatter(games[4])
rows_pure = row_formatter(games[5])
# rows_pure = row_formatter(games[6])  ## * (3)
# rows_pure = row_formatter(games[7])
# rows_pure = row_formatter(games[8])  ## * (8)
# rows_pure = row_formatter(games[9])
# rows_pure = row_formatter(games[11])  ## * (5)
# rows_pure = row_formatter(games[12])  ## * (10) !!! Bad!
# rows_pure = row_formatter(games[13])  ## * (5) !!! Bad!
# rows_pure = row_formatter(games[14])  ## *

rows = rows_pure

def pretty_print(rows)
  pretty = rows.map {|a| a.join('  ')}
  pretty.map! {|a| a.insert(-1, "\n")}
  pretty
end


def col_formatter(rows)
  cols = rows[0..8].transpose.to_a
  cols
end


def coord_finder(rows)
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


def box_array_maker(rows)
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


def coordinates_iterator(rows)
  cols = col_formatter(rows)
  all_coords = coord_finder(rows)
  boxes = box_array_maker(rows)

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


# WORKS FROM HERE
# puts "\n\n- coordinates_iterator - #{"-"*30}\n\n"
# puts "#{coordinates_iterator(rows)}"
# puts "\n\n- coordinates_iterator - #{"-"*30}\n\n"



#################################
def prioritizer(all_avails)
  grouped_avails = all_avails.group_by{|e| e}.map{|k, v| [k, v.length]}.to_a  ## => Groups concats by quantity of each num.
  sorted = grouped_avails.sort_by{|k|k[1]}  ## => Sorts denominations.
  sorted.reverse! ## => Reverse sorts, so most frequently available nums used first.
  rank = []
  i=0
  for i in 0...sorted.length
    rank << sorted[i][0]
  end
  # p sorted
  rank
end

#################################
def evaluator(rows, level)
  data = coordinates_iterator(rows)
  cols = col_formatter(rows)
  start_dash_count = coord_finder(rows).count
  puts "\n\n== Starting Puzzle =="
  puts pretty_print(rows)

  all = '1,2,3,4,5,6,7,8,9'.split(',')
  all_avails = [] ## => Stores all possible options for entire game's dashes.

  puts "\n\n#{"="*25}\n\n"
  puts "Dashes: #{start_dash_count}"

  coordinates_iterator(rows).each do |d|  ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
    filled = d[1]+d[2]+d[3]
    bank = all - filled

    if bank.count == 1 && level >= 0
      unless bank[0] == 0 || bank[0] == nil
        rows[d[0][0]][d[0][1]] = bank[0]
      end
    elsif bank.count == 2 && level >= 1
      bank_rank = []

      coordinates_iterator(rows).each do |d|  ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
        filled = d[1]+d[2]+d[3]
        bank = all - filled
        all_avails = all_avails.concat(bank)
        bank_rank = prioritizer(all_avails)
        bank_rank = bank_rank
      end

      if bank.include?(bank_rank[0])
        bank_rank = bank_rank[0]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[1])
        bank_rank = bank_rank[1]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[2])
        bank_rank = bank_rank[2]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[3])
        bank_rank = bank_rank[3]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[4])
        bank_rank = bank_rank[4]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      else
        unless bank[0] == 0 || bank[0] == nil
          rows[d[0][0]][d[0][1]] = bank[0]
        end
      end
      level = 0
    elsif bank.count == 3 && level >= 1
      bank_rank = []

      coordinates_iterator(rows).each do |d|  ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
        filled = d[1]+d[2]+d[3]
        bank = all - filled
        all_avails = all_avails.concat(bank)
        bank_rank = prioritizer(all_avails)
        bank_rank = bank_rank
      end

      if bank.include?(bank_rank[0])
        bank_rank = bank_rank[0]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[1])
        bank_rank = bank_rank[1]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[2])
        bank_rank = bank_rank[2]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[3])
        bank_rank = bank_rank[3]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[4])
        bank_rank = bank_rank[4]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      else
        unless bank[0] == 0 || bank[0] == nil
          rows[d[0][0]][d[0][1]] = bank[0]
        end
      end
      level = 0
    elsif bank.count >= 4 && level >= 1
      bank_rank = []

      coordinates_iterator(rows).each do |d|  ## => Data Array: coords = d[0], row = d[1], col = d[2], box = d[3]
        filled = d[1]+d[2]+d[3]
        bank = all - filled
        all_avails = all_avails.concat(bank)
        bank_rank = prioritizer(all_avails)
        bank_rank = bank_rank
      end

      if bank.include?(bank_rank[0])
        bank_rank = bank_rank[0]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[1])
        bank_rank = bank_rank[1]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[2])
        bank_rank = bank_rank[2]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[3])
        bank_rank = bank_rank[3]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      elsif bank.include?(bank_rank[4])
        bank_rank = bank_rank[4]
        unless bank_rank == 0 || bank_rank == nil
          rows[d[0][0]][d[0][1]] = bank_rank
        end
      else
        unless bank[0] == 0 || bank[0] == nil
          rows[d[0][0]][d[0][1]] = bank[0]
        end
      end
      level = 0
    end
  end

  # NOT WORKING FROM HERE
  # puts "\n\n- coordinates_iterator - #{"-"*30}\n\n"
  # puts "#{coordinates_iterator(rows)}"
  # puts "\n\n- coordinates_iterator - #{"-"*30}\n\n"


  puts pretty_print(rows)
  # p rows
  puts "#{"-"*30}"

  dash_counts = [start_dash_count, coord_finder(rows).count]
  dash_counts
end

def validator(rows)
  model = (1..9).to_a
  i = 0
  rows.each do |row|
    if row.include?('-')
      row.delete('-')
    end

    row = row.map!{|r| r.to_i}
    row = row.uniq.sort!

    if model == row
      puts "row(#{i}) - Pass: #{row}"
    else
      puts "row(#{i}) - Fail: #{row}"
    end
    i+=1

  end
end

def validator_caller(rows)
  data = coordinates_iterator(rows)

  puts "\n\n- VALIDATOR - #{"-"*30}\n\n"

  # data.each do |d|
  #   row = d[1]
  #   col = d[2]
  #   box = d[3]

  puts data

    # puts "****row: #{row}"
    # puts "****col: #{col}"
    # puts "****box: #{box}"
    # validator(rows)
  # end

  puts "\n\n#{"-"*30}\n\n"



end


def runner(rows)
  level = 0
  dash_counts = evaluator(rows, level)
  puts "Start: #{dash_counts[0]} / End: #{dash_counts[1]}"


  loop do
    if dash_counts[0] == dash_counts[1]
      level = 0
      dash_counts = evaluator(rows, level)
      puts "Start: #{dash_counts[0]} / End: #{dash_counts[1]}"
    end

    while dash_counts[0] != dash_counts[1]
      level = 0
      dash_counts = evaluator(rows, level)
      puts "Start: #{dash_counts[0]} / End: #{dash_counts[1]}"
    end

    if dash_counts[0] == dash_counts[1]
      level = 1
      dash_counts = evaluator(rows, level)
      puts "Start: #{dash_counts[0]} / End: #{dash_counts[1]}"
    end

    break if dash_counts[1] == 0

  end

  # p validator(rows)
  # validator_caller(rows)


end




runner(rows)



# evaluator(rows, level=0)

###############################



# def validator(row,col,box)
#   all = (0..9).to_a
#   filled = row+col+box
#   bank = all - filled
#
#   puts "Filled: #{filled}"
#   puts "Bank: #{bank}"
# end
#
# p validator(row,col,box)
