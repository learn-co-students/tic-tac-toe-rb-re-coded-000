def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def input_to_index(position)
  position.to_i- 1
end
def move(board, position, player)
  board[position.to_i- 1]= player
end
def position_taken?(board,index)
  if board[index]== " " || board[index]== "" || board[index]==nil
    return false
  elsif board[index]=="X" || board[index]=="O"
    return true
  end
end
def valid_move?(board,position)
  if  ((position.to_i.between?(1,9)) && !(position_taken?(board,position.to_i - 1)))
    return true
  else
    return false
  end
end
def turn(board)
  puts "Please enter 1-9:"
  position=gets.strip
  m2 =position.to_i
  n =current_player(board)
  if valid_move?(board,position)
    move(board,m2,n)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  count =0
  board.each do |item|
    if item == "X" || item == "O"
      count +=1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board)%2 ==0
    return "X"
  else
    return "O"
  end
end
def won?(board)
  WIN_COMBINATIONS.detect do |i|
    board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && position_taken?(board, i[0])
  end
end
def full?(board)
  result = true

board.each do |i|
  if i != "X" && i != "O"
    result = false
  end
end
result
end
#  def full?(board)
#    board.all? do |item|
#      item = "X" || item = "O"
# end

#     result
#end
def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
draw?(board) || won?(board)
end
def winner(board)
i =won?(board)
if i
  return board[i[0]]
end
end

def position_taken?(board, location)
!(board[location].nil? || board[location] == " ")
end
def play(board)
  while !over?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cats Game!"
    end
end
