# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6], # right diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] 
   end
end

def full?(board)
  WIN_COMBINATIONS.all? do |combo|
    position_taken?(board, combo[0]) && position_taken?(board, combo[1]) && position_taken?(board, combo[2])
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
  end
end

board = ["X", "O", "X", "O", "O", "O", "O", "X", "O"]
puts winner(board)