# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
########################################################
def move(arr,indx,usr_)
  index = indx -1
  arr[index] = usr_
  return arr
end
########################################################

########################################################
def valid_move?(board,position)
  position=(position.to_i) -1
  if position >= 0 && position <= 8 #position.to_i.between?(0,8)
    if ! position_taken?(board, position)
      return true
    else return false
    end
  else return false
  end
end
########################################################
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  intger=input.to_i
  #position = intger.to_i -1
  if valid_move?(board, input)
    move(board, intger,"X")
    display_board(board)
  else
    turn(board)
  end
end
########################################################
# Define your play method below
def play(board)

  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  else
  end
end


##################################

########################################################


# Helper Method
def current_player(board)
  counter =turn_count(board)
  if counter % 2 ==0
    return "X"
  else return "O"
  end
end
########################################################

def turn_count(board)
  counter=0
  board.each do |player|
    if player=="X" || player=="O"
      counter+=1
    end
  end
return counter
end
###########################################################

#current_player(Array.new(9," "))

def position_taken?(board,position)
 if board[position]== "" || board[position]== " "
  return false
 elsif board[position]== nil
  return false
 elsif board[position]=="X" || board[position]=="O"
   return true
 end
end###################################################

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS  = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.detect do |e|
    board[e[0]] == board[e[1]] &&  board[e[1]] == board[e[2]] &&  position_taken?(board, e[0])
  end
end

########################################################

def full?(board)
 if board.none?{|e| e==" "} #draw
  return true
 else return false
 end
end
########################################################

###############################333333
def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  else
    return false
  end
end
############################
def winner(board)
  if won?(board)
    #return current_player(board)
      WIN_COMBINATIONS.each  do |a|
    if board[a[0]] =="O" &&  board[a[1]] =="O" && board[a[2]] =="O"
      return "O"
    elsif board[a[0]] =="X" &&  board[a[1]] =="X" && board[a[2]] =="X"
      return "X"
     end
                             end
  else
    return nil
  end
end

x=won?(["X", "O", "X", "O", "X", "X", "O", "O", "X"])
puts x.to_s#x[0].to_s + x[1].to_s + x[2].to_s
