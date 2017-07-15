def generate_tic_tac_toe
  board = [[]]*3
  board[0] = Array.new(3) { ["X", "O"].sample }
  board[1] = Array.new(3) { ["X", "O"].sample }
  board[2] = Array.new(3) { ["X", "O"].sample }

  board
end

tic_tac = generate_tic_tac_toe

p tic_tac



#########
# numbers = Array.new
# # => []
# 20.times { numbers << rand(5) }
# # => 20
# numbers
# # => [2, 3, 0, 1, 3, 4, 0, 1, 0, 1, 3, 4, 2, 4, 1, 3, 0, 3, 4, 2]
# Array.new(5)
# # => [nil, nil, nil, nil, nil]
# Array.new(3, :a)
# # => [:a, :a, :a]
# Array.new(20) { rand(5) }
# # => [4, 4, 2, 1, 3, 4, 3, 0, 3, 0, 3, 4, 3, 1, 4, 3, 4, 3, 3, 2]
# generate_tic_tac_toe
# # => [["X", "O", "X"], ["O", "O", "X"], ["X", "X", "O"]]
# generate_tic_tac_toe
# # => [["O", "O", "X"], ["X", "X", "O"], ["O", "O", "X"]]
# Array.new(5, [1, 2, 3].sample)
# # => [1, 1, 1, 1, 1]
# Array.new(5) { [1, 2, 3].sample }
# # => [2, 2, 3, 1, 3]
##########
