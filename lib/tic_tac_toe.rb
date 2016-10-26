
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def move(board,position,value)
  index= position-1
  board[index]=value
end
def position_taken?(board,position)
  if board[position]== " " || board[position]== "" || board[position]== nil
 return false
elsif board[position]== "X" || board[position]== "O"
 return true
 end
end
def valid_move?(board,position)
if (position.to_i-1).between?(0,8)
  if !position_taken?(board,position.to_i-1)
        return true
  end
  else
    return false
  end
end
def turn(board)
  puts "Please enter 1-9:"
  position=gets.strip
  position2=position.to_i
  token=current_player(board)
  if valid_move?(board,position)
    move(board,position2,token)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  count=0
  board.each do |index|
    if index =="X" || index=="O"
      count +=1
    end
  end
count
end
def current_player(board)
  counter=turn_count(board)
  if counter.even?
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
    item=="X"|| item=="O"
  end
end
def draw?(board)
     !won?(board) && full?(board)
end
def over?(board)
  draw?(board)||won?(board)
end
def winner(board)
  combo=won?(board)
  if combo
    return board[combo[0]]
  end
end

def play(board)
  counter=0
    while !over?(board)

       turn(board)
#       if won?(board)
#        puts "Congratulations "+ winner(board)+"!"
#         break
#       end
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
