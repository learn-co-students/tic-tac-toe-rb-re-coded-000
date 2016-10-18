WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],
                  [0,3,6],[1,4,7],[2,5,8],
                     [0,4,8],[2,4,6]]
                     def display_board(board)
                       puts " #{board[0]} | #{board[1]} | #{board[2]} "
                       puts "-----------"
                       puts " #{board[3]} | #{board[4]} | #{board[5]} "
                       puts "-----------"
                       puts " #{board[6]} | #{board[7]} | #{board[8]} "
                     end
                     def move(board, location, current_player)
                       board[location.to_i-1] = current_player
                     end
                     def position_taken?(board,index)
                       if board[index] == " "||board[index] ==""||board[index] ==nil
                         return false
                       elsif board[index] =="X"||board[index] =="O"
                         return true
                     end
                     end
                     def valid_move?(board,position)
                       index=position.to_i-1;
                       if position.to_i.between?(1,9)&&!position_taken?(board,index)
                         true
                       else
                         false
                       end
                     end
                     def turn(board)
                       puts "Please enter 1-9:"
                     input=gets.strip
                     if valid_move?(board,input)
                       move(board,input,current_player(board))
                       display_board(board)
                     else
                       turn(board)
                     end
                     end
                     def turn_count(board)
                       count=0
                       board.each do |item|
                         if item =="X"||item=="O"
                         count+=1
                       end
                     end
                     return count
                     end
                     def current_player(board)
                       if turn_count(board)%2==0
                         return "X"
                       else
                         return "O"
                       end
                     end
                     def won?(board)
                       WIN_COMBINATIONS.detect do |rezano|
                         board[rezano[0]]==board[rezano[1]] &&
                         board[rezano[1]]==board[rezano[2]] &&
                         position_taken?(board,rezano[0])
                     end
                     end
                     def full?(board)
                       board.all?do|rezano|
                       rezano=="X"||rezano=="O"
                       end
                     end
                     def draw?(board)
                       !won?(board)&&full?(board)
                     end
                     def over?(board)

                     draw?(board)||won?(board)
                     end
                     def winner(board)
                       rezano=won?(board)
                       if rezano
                         return board[rezano[0]]
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
