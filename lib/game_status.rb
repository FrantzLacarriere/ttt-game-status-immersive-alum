# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # First diagnol
  [2,4,6]  # Last diagnol
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? { |index| board[index] == "X" } ||
    win_combo.all? { |index| board[index] == "O" }
  end
end

def full?(board)
  !board.any? { |index| index == " " || index == "" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  won = won?(board)
  board[won[0]] if (won)
end
