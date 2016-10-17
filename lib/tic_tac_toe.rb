WIN_COMBINATIONS=[[0,1,2],
                  [3,4,5],
                  [6,7,8],
                  [0,3,6],
                  [1,4,7],
                  [2,5,8],
                  [0,4,8],
                  [2,4,6]]
  def display_board(board)
                    puts " #{board[0]} | #{board[1]} | #{board[2]} "
                    puts "-----------"
                    puts " #{board[3]} | #{board[4]} | #{board[5]} "
                    puts "-----------"
                    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(position)
    index=position.to_i-1
    return index
  end

  def move(board, position, value)
    index=input_to_index(position)

    board[index] = value
  end
  # code your #valid_move? method here
  def valid_move? (board,position)
    position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
  end

  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken? (board,position)
    if board[position]==" " || board[position]=="" || !board[position]
      return false
    elsif board[position]=="X" || board[position]=="O"
      return true
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
      else return "O"
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
    def won?(board)
      WIN_COMBINATIONS.detect do |combo|
        board[combo[0]]==board[combo[1]]&&
        board[combo[1]]==board[combo[2]]&&
        position_taken?(board,combo[0])
      end
    end
    def full?(board)
      board.all? do |itm|
        itm=="X"||itm=="O"
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
        return board[combo[2]]
      end
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
