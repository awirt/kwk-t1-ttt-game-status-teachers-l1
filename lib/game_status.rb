# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #bottom row
  
  [2,4,6], #diagonal
  [0,4,8], #diagonal
  [0,3,6], #column 1
  [1,4,7], #column 2
  [2,5,8], #column 3
  
  ]

# WON? will read a board as an argument and return false/nil if there's no win combo present and return winning combo indices as array if there is a win...iterate over possible win combos and check if board has the same player token in each index of a winning combo.

#for each i in WIN_COMBINATIONS, read in the indices, check board for positions at each index, then check if all the positions are the same. if so, then return that i as part of winning combo array

def won?(board)
  WIN_COMBINATIONS.detect do |i|
    
    index_1 = i[0]
    index_2 = i[1]
    index_3 = i[2]
    
    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]
    
    (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
  end
end
  
######################################################

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

######################################################

#returns true if board has not been won && full
#returns false if board is not won && not full
#returns false if board is won

def draw?(board)
  if full?(board) && (won?(board) == nil)
    return true
  elsif !(full?(board)) && (won?(board) == nil)
    return false
  elsif won?(board) != nil
    return false
  end
end

######################################################
#true if board has been won, is a draw, or is full
#else returns false

def over?(board)
  if (won?(board) != nil) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

######################################################

#returns token that won the game when given a winning board
#otherwise returns nil

def winner(board)
  if (won?(board) != nil)
    win_combo = won?(board) #an array with the winning indices
    return board[win_combo[0]]
  else
    return nil
  end
end

x_win_diagonal = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
puts winner(x_win_diagonal)





















































