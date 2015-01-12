require "pry"
@table = (1..9).to_a
@wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]
@choices = [1, 2, 3, 4]
# hash to board index stuff


def greeting
  puts "Welcome to Tic Tac Toe"
  puts "PvP or CPU?"
  #@choices.each do |x|
   # gets.chomp.to_i
  #if x[0]
    #ttt_game
  #end
  #if x[1]
    #ttt_game_2
  #end
 #end   
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
  if x.even? 
    puts "CPU's turn."
  else puts "Player's turn"
  end
  x_choice = gets.chomp.to_i
  if x.even?  
    board[player_choice - 1] = "O"
  else puts "X"
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
    puts "Winner! Press Return to Exit"
    gets
  end
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
  turn_counter = 9 
  while turn_counter > 0
    print_board
    table = take_turn(table, turn_counter)
    turn_counter -= 1
    if winner? == true 
    return false
    end
    if turn_counter == 0
      puts "Its a Draw!"
    end
  end    
end 

#def ttt_game_2
  #turn_counter = 10 
  #while winner? == false
    #print_board
    #table = cpu_turn
    #turn_counter -= 1
  #end    
#end
 
ttt_game 

  #cpu needs to be able to select different corresponding number and replace with O
  #end in draw
  #easy, medium, hard, legendary	 
