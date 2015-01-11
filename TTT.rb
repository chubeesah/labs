require "pry"
@table = (1..9).to_a
@wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]

# hash to board index stuff


def greeting
  puts "Welcome to Tic Tac Toe"
end

def print_board
  puts "
     #{@table[0]} | #{@table[1]} | #{@table[2]}
     #{@table[3]} | #{@table[4]} | #{@table[5]}
     #{@table[6]} | #{@table[7]} | #{@table[8]}
  " 
end

def take_turn(board, player)
  board = @table
  if player.odd? 
    puts "X's turn."
  else
    puts "O's turn."
  end
  player_choice = gets.chomp.to_i
  if player.odd? 
    board[player_choice - 1] = "X"
  else 
    board[player_choice - 1] = "O"
  end
  board
end

def cpu_turn
  @table.reject{ |x| x.class == String }
   board = @table
  if player.even? 
    puts "CPU's turn."
  end
  player_choice = gets.chomp.to_i
  if player.even?  
    board[player_choice - 1] = "O"
  end
  board
end

def winner?
  board = @table
  @wins.any? do |i| 
  a = board[0] == board[1] && board[0] == board[2] || board[3] == board[4] && board[3] == board[5] ||
      board[6] == board[7] && board[6] == board[8]
  b = board[0] == board[3] && board[0] == board[6] || board[1] == board[4] && board[1] == board[7] ||
      board[2] == board[5] && board[2] == board[8]
  c = board[0] == board[4] && board[0] == board[8] || board[2] == board[4] && board[2] == board[6] 
  if a || b || c
    puts "Winner!"
    gets
  end
  return false
 end
end

def play_again?
  puts "Play again? y/n"
  gets.chomp
  y = ttt_game.new
  n = false
end

def ttt_game
  greeting
  turn_counter = 1 
  while turn_counter < 10
    print_board
    table = take_turn(table, turn_counter)
    turn_counter += 1 
   
  if winner? == true
      then turn counter == 10
    return false 
    end
  end 
end
 
ttt_game 

  #cpu needs to be able to select different corresponding number and replace with O
  #end in draw
  #easy, medium, hard, legendary	 
