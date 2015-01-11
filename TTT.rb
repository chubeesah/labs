require "pry"

@table = (1..9).to_a
@wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]

# hash to board index stuff


def greeting
  puts "Welcome to Tic Tac Toe"
  puts "Choose a Difficulty:
  Pvp 
  Not so Tough 
  A Little Tough
  This is Quite Hard"
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
    puts "Player 1's turn."
  else
    puts "Player 2's turn."
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
  if player.even 
end

def winner?
  board = @table
  win = @wins
  win.any? { |i| } 
  a = board[0] == board[1] && board[0] == board[2] 
  b = board[0] == board[3] && board[0] == board[6]
  c = board[0] == board[4] && board[0] == board[8] || board[2] == board[4] && board[2] == board[6] 
  if a || b || c
    puts "Winner!"
  end
 end    
end 

def ttt_game
  greeting
  turn_counter = 1 
  while turn_counter < 10 
    print_board
    table = take_turn(table, turn_counter)
    turn_counter += 1 
    until
      winner?
    end  
  end        
end
 
ttt_game	

  #cpu needs to be able to select different corresponding number and replace with O
	#end with three in a row???
  #end in draw
  #easy, medium, hard, legendary	 
