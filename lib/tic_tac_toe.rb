
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board,position)
  if board[position]==" " || board[position]=="" || board[position]==nil
    return false
  else board[position]=="X" || board[position]=="O"
    return true
  end
end

def move(board,index,arg)
  index = index -1
  board[index]= arg
  return board
end

def full?(board)
  board.all? do |itm|
    itm == "X" || itm == "O"
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  i = won?(board)
 if i
   return board[i[0]]
 end
end

def draw?(board)
  !won?(board) && full?(board)
end

def valid_move?(board,position)
  if  ((position.to_i.between?(1,9)) && !(position_taken?(board,position.to_i - 1)))
    return true
  else
    return false
  end
end

def position_taken?(board,position)
  if board[position]==" " || board[position]=="" || board[position]==nil
    return false
  else board[position]=="X" || board[position]=="O"
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if !valid_move?(board,position)
    turn(board)
  end
  move(board,position.to_i,current_player(board))
  display_board(board)
end
def turn_count(board)
count = 0
board.each do |s|
  if s == "X" || s == "O"
    count += 1
  end
end
count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end
def won?(board)
WIN_COMBINATIONS.detect do |i|
  board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && position_taken?(board,i[0])
end
end

def play(board)
  while !over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
