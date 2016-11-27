# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # first row
  [3,4,5], # middle row
  [6,7,8], # last row
  [0,3,6], # first column
  [1,4,7], # middle column
  [2,5,8], # last column
  [0,4,8], # forward diagonal
  [2,4,6]  # reverse diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    if (board[comb[0]] == board[comb[1]] &&
        board[comb[1]] == board[comb[2]] &&
        (board[comb[0]] == 'X' || board[comb[0]] == 'O'))
      return comb
    end
  end
  return nil
end

def full?(board)
  board.each do |x|
    if x != 'X' && x != 'O'
      return false
    end
  end
  return true
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  comb = won?(board)
  if comb
    return board[comb[0]]
  end
  return nil
end

def turn_count(board)
  count = 0
  board.each do |space|
    count += (space == 'X' || space == 'O') ? 1 : 0
  end
  count
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player)
  board[location-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, location)
  location = location.to_i - 1
  location.between?(0,8) && !position_taken?(board, location)
end

def turn(board)
  valid = false
  while !valid
    puts "Please enter 1-9:"
    input = gets.strip
    valid = valid_move?(board, input)
  end

  move(board, input.to_i, current_player(board))
  display_board(board)
end

# Define your play method below
def play(board)
  while !over?(board)
    turn(board)
  end

  print "hi\n"

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
