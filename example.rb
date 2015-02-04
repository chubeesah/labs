WINS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

def greeting
  system "clear"
  puts "Welcome to Tic Tac Toe"
end

def create_board
  board = Array.new(9)
  board = board.each_index { |x| board[x] = x + 1 }
end

def user_turn

end

def computer_turn
  
end

def draw_board(board)
  system "clear"
  board.each_index do |x|  #this is ugly
    if (x == 2) || (x == 5) 
      print " [#{board[x]}]\n"
    else
      print " [#{board[x]}]"
    end
  end
  puts
end

def write_board(board, input, player)
  if player.even?
    player_var = 'X'
  else
    player_var = 'O'
  end
  board[input] = player_var
end

def win?(board)
  #if the board has the same elements that match the indexes of WINS
  #user wins

  # WINS.each do |x|
  #   board.each do |y|
  #       puts y
  #       gets
  #   end
  # end

  WINS.each do |x|
    xcount = 0
    ycount = 0
    x.each do |y|
      if board[y] == "X"
        xcount += 1
        if xcount == 3
          puts "X Wins"
          gets
          return false
        end
      end
      if board[y] == "O"
        ycount += 1
        if ycount == 3
          puts "O Wins"
          gets
          return false
        end
      end
    end
  end
  return true
end


#===================================================================================

def user_location_choice(board, player)
  valid = false
  if player.even?
    player_var = 'X'  
  else
    player_var = 'O'
  end
  print "\"#{player_var}\"s turn: "
  input = gets.chomp
  #Do input error checking here
  input = input.to_i
  input -= 1
  write_board(board, input, player)
end


#===================================================================================

def game_choice
  puts "What type of game would you like to play"
  puts "\t1) 2 Player\n\t2) Computer (easy)\n\t3) Computer (hard)"
  gets.chomp
end


def game
  game_in_progress = true
  turn_count = 0
  board = create_board
  while game_in_progress
    draw_board(board)
    user_location_choice(board,turn_count)
    turn_count += 1
    game_in_progress = win?(board)
  end
  system "clear"
  draw_board(board)
  if turn_count.even?
    puts "X Won!!!"
  else
    puts "Y Won!!!"
  end
  gets
end

game