def current_player(board)
  counter =turn_count(board)
  puts counter
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








##################3
if board.all? { |e| e==" " }
c=1
arr=["X","O","X"]
arr.each do |e|
move(board,c,e)
c+=1
end
end
####################
x= current_player(["X", "O", " ", "X", " ", " ", " ", "O", "X"])
puts x
