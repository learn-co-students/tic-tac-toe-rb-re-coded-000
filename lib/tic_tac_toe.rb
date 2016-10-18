WIN_COMBINATIONS=[
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]
def display_board (board=[" "," "," "," "," "," "," "," "," "," "])
  a=" #{board[0]} | #{board[1]} | #{board[2]} "
  b="-----------"
  c=" #{board[3]} | #{board[4]} | #{board[5]} "
  d="-----------"
  e=" #{board[6]} | #{board[7]} | #{board[8]} "
  puts a,b,c,d,e
end
def move(board,index,value)

board[index.to_i-1] = value
end
def position_taken?(board,index)
if board[index] == " " || board[index] == "" || board[index] == nil
  false
elsif board[index] == "X" || board[index] == "O"
true
end

end
def valid_move?(board,position)
  if position.to_i.between?(1,9)&&!position_taken?(board,position.to_i-1)
    true
  else false
  end
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  location = input.to_i-1
  if !valid_move?(board,input)
    turn(board)
  end
  move(board, input, current_player(board))
  display_board(board)
end
def turn_count(board)
  count=0
  board.each do |xo|
    if xo =="X" || xo == "O"
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
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board,combo[0])
  end
end
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end
def draw?(board)
!won?(board) &&  full?(board)
end
def over?(board)
draw?(board) || won?(board)
end
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

# Define your play method below
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
