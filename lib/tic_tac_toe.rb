WIN_COMBINATIONS= [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def move(board,index,value)
  index = index.to_i
  index = index - 1
  board[index]= value
end
def position_taken?(board,position)
  if board[position]==" " || board[position]=="" || board[position]==nil
    return false
  else board[position]=="X" || board[position]=="O"
    return true
  end
end
def valid_move?(board,position)
if position.to_i.between?(1,9) && !position_taken?(board,position.to_i-1)
  return true
  els false
end
end
def turn(board)
  puts "Please enter 1-9:"
  position=gets.strip
  if valid_move?(board,position)
    move(board, position,current_player(board))
    display_board(board)
  else
      turn(board)

end
end
def current_player(board)
  counter=turn_count(board)
  if counter % 2 == 0
    "X"
  else
    "O"
  end
end
def turn_count(board)
  counter = 0
  board.each do |u|
    if u =="X" || u =="O"
      counter += 1
    end
  end
  counter
end
def won?(board)
WIN_COMBINATIONS.detect do |combo|
  board[combo[0]]==board[combo[1]]&&
  board[combo[1]]==board[combo[2]]&&
  position_taken?(board,combo[0])
end
end
def full?(board)
  board.all?{|itm| itm=="X" || itm=="O"}
  end
  def draw?(board)
      !won?(board) && full?(board)
  end
  def over?(board)
    draw?(board) || won?(board)
  end
  def winner(board)
    combo=won?(board)
    if combo
      board[combo[0]]
    end
  end
  def winner(board)
    combo=won?(board)
    if combo
      board[combo[0]]
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
