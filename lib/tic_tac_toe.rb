
WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def move(board,input,value)
  index = input_to_index(input)
  index = index - 1
  board[index]=value
end
def input_to_index(input)
  index = input.to_i
end
def position_taken?(board,index)
  if ((board[index] == "") || (board[index] == " "))
    false
  elsif ((board[index] == "X") || (board[index] == "O"))
    true
  else
    false
  end
end

def valid_move?(board, position)
  position = position.to_i
  position= position - 1
if ((!position_taken?(board,position)) && (position.between?(0,8)))
  true
 elsif ((board[position] == "X") || (board[position] == "O"))
  false
end
end
def turn(board)
puts "Please enter 1-9:"
position = gets.strip
if (valid_move?(board,position))
  move(board,position,current_player(board))
  display_board(board)

else
turn(board)
end
end
def turn_count(board)
i = 0
count = 0
board.each do |index|
if index == "X" || index == "O"
  count += 1
end
end
count
end
#--------------------------------------
def current_player(board)
turn_count(board).even? ? "X" : "O"
end
def won?(board)
WIN_COMBINATIONS.detect do |combo|
board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
  end
end
def full?(board)
  board.each do |as|
    if as == " "
      return false
    end
  end
  return true
end
def draw?(board)
  !won?(board)&&full?(board)
end
def over?(board)
  if draw?(board) && !won?(board)
    return true
  elsif won?(board) && !draw?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
else
  puts "Cats Game!"
end
end
