WIN_COMBINATIONS =[ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]

def display_board(board=[" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board,position,value)
  index=input_to_index(position)
  board[index]=value
end

def input_to_index(position)
  position.to_i-1
end

def valid_move?(board,position)
  if position.to_i.between?(1,9) && !position_taken?(board,position.to_i-1)
true
end
end

def position_taken?(board,position)
 if board[position]== "" || board[position]== " " || board[position]== nil
  return false
 elsif board[position]=="X" || board[position]=="O"
   return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position=gets.strip
  if valid_move?(board,position)
    move(board,position,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board) %2 == 0
    return "X"
  else
    return "O"
  end
end

 def turn_count(board)
 count = 0
board.each do |item|
 if item == "X" || item =="O"
 count +=1
 end
 end
 return count
 end
#     we can use this way too :

#     def turn_count(board)
#     turn_count=0
#     counter
#     while counter < board.size
#     if board[counter] == "X" || board[counter] == "O"
#     turn_count+=1
#     end
#     counter+=1
#     end
#     return turn_count
#     end

def won?(board)
WIN_COMBINATIONS.detect do |combo|
  board[combo[0]]== board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
end
end

def full? (board)                    #we can use this way too :
  board.all? do |item|               #board.none? do |item|
    item == "X" || item =="O"        #item == " " || item == nil
end                                  #end
end

def draw?(board)
   !won?(board)&&full?(board)
end

def over?(board)
draw?(board) || won?(board)
end

def winner(board)
  combo=won?(board)
  if combo
    return board[combo[0]]
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
