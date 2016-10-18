WIN_COMBINATIONS=[

  [6,7,8],
  [0,1,2],
  [3,4,5],
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


def position_taken?(board,index)
if board[index] == ""|| board[index] == " " ||board[index]== nil
  return false
elsif board[index]=="X" ||board[index]== "O"
  return true
end
end

def move(board,position,s)
  position=position.to_i
  board[position-1]=s
  display_board(board)
end
# code your #vdef full? (board)
def full? (board)
  board.all? do |itm|
    itm =="X"||itm=="O"
  end
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

def draw?(board)
   ! won?(board)&&full?(board)
end
#---------def play (board)

def valid_move?(board,position)
  if position.to_i.between?(1,9) && ! position_taken?(board,position.to_i-1)
    return true
  else false
end
end
def position_taken? (board,index)
if board[index] == ""|| board[index] == " " ||board[index]== nil
  return false
elsif board[index]=="X" ||board[index]== "O"
  return true
end
end
def turn(board)
  puts "please enter 1-9:"
  input = gets.strip
  if !valid_move?(board, input)
turn(board)
end
move(board, input, current_player(board))
display_board(board)
end
def turn_count(board)
   counter = 0
    board.each do |u|
       if u =="X" || u =="O"
          counter+=1
         end
       end
       counter
      end
      def current_player(board)
         counter=turn_count(board)
         if counter % 2 == 0
           "X"
          else
             "O"
            end
           end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]]==board[combo[1]]&&
    board[combo[1]]==board[combo[2]]&&
position_taken?(board,combo[0])
end
end
def play (board)
    while !over?(board)
    turn(board)

  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
# re-define your #position_
