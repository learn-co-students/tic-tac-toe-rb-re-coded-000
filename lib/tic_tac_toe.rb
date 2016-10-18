WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player) #modified by deleting "X"
  board[location.to_i-1] = current_player
end

def position_taken?(board,index)
  if board[index]==" " || board[index]=='' || board[index]==nil
    return false
  elsif board[index]=="X" || board[index]=="O"
    return true
  end
end

def valid_move?(board,position)
  if position.to_i.between?(1,9) && !position_taken?(board,position.to_i-1)
true
else
  false
end
end

def turn(board)
  puts "Please enter 1-9:"
  position=gets.strip
  if valid_move?(board,position)
    move(board,position,current_player(board))  #modified by adding current_player(board) becouse we omit "X above"
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
counter=0
 board.each do |position|
  if position=="X" || position=="O"
  counter+=1
end
end
return counter
end

def current_player(board)
  if turn_count(board)%2==0
    return "X"
  else
  return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]]==board[combo[1]]&&
    board[combo[1]]==board[combo[2]]&&
    position_taken?(board,combo[0])
  end
end

def full?(board)
  board.all? do |item|
  item=="X" || item=="O"
end
end

def draw?(board)
!won?(board)&&full?(board) #exchange betweenthem : !won?(board)&&full?(board) and that becouse stubid lab
end

def over?(board)
  draw?(board)||won?(board) #full or draw
end

def winner(board)
  combo=won?(board)
  if combo #means won (array) not nil
    return board[combo[0]]
  end
end

def play(board)
while !over?(board) #modified becouse maybe the game finish before comleting the 9 move
  turn(board)
end
if won?(board) #we add this condition
  puts "Congratulations #{winner(board)}!"
else #in case no one win (equel)
  puts "Cats Game!"
end
end
#we will work now by bin
