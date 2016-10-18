WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  board[index]== "X" || board[index] == "O"
  # Creates a stop on RSpec
  # !(board[location].nil? || board[location] == "")
end
def valid_move?(board, input)
  input.to_i.between?(1,9) && !position_taken?(board, input.to_i-1)
end
def input_to_index(position)
  position.to_i-1
end
# code your move method here!
def move(board,position,value)
  index = input_to_index(position)
  board[index] = value

end
def turn(board)
  puts "Please enter 1-9:"
  position=gets.strip
  if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  counter =0
  board.each do |item|
    if item == "X" || item == "O"
      counter+=1
    end
  end
  return counter
end
def current_player(board)
  if turn_count(board)%2 == 0
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
  board.all? do |itm|
    itm == "X" || itm == "O"
  end
end
def draw?(board)
  !won?(board)&&  full?(board)
end
def over?(board)
  draw?(board) || won?(board)
end
def winner(board)
  combo =  won?(board)
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
