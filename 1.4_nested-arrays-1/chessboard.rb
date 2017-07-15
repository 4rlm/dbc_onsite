def generate_chessboard
  arr = [[]]*8
  arr[0] = ['B Rook', 'B Knight', 'B Bishop', 'B Queen', 'B King', 'B Bishop', 'B Knight', 'B Rook']
  arr[1] = cloner(arr, 'B Pawn')
  arr[2] = cloner(arr, nil)
  arr[3] = cloner(arr, nil)
  arr[4] = cloner(arr, nil)
  arr[5] = cloner(arr, nil)
  arr[6] = cloner(arr, 'W Pawn')
  arr[7] = ['W Rook', 'W Knight', 'W Bishop', 'W Queen', 'W King', 'W Bishop', 'W Knight', 'W Rook']
  arr
end

def cloner(arr, str)
  temp = []
  8.times{temp << str}
  arr = temp
  arr
end

board = generate_chessboard

p board
