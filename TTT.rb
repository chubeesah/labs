require "pry"

table = (1..9).to_a
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]
# hash to board index stuff


def greeting
  puts "Welcome to Tic Tac Toe" 
end

def choose_mode()
  puts "#PvP(1) or CPU(2)?"
  result = gets.chomp
  if result == 1
    :human
  elsif result == 2
    :cpu
  end
end

def choose_player
  puts "Player 1: X or O?"
  result = gets.chomp.upcase
  until ["X", "O"].include?(result)
    puts "Not a choice. Pick again!"
    result = gets.chomp.upcase
  end
  result
end

def print_board(table)
  puts "
     #{table[0]} | #{table[1]} | #{table[2]}
     #{table[3]} | #{table[4]} | #{table[5]}
     #{table[6]} | #{table[7]} | #{table[8]}
  " 
end

def take_turn(table, turn, player)
  player_choice = gets.chomp.to_i
  # the variable player here is 'X' or 'O'
  other_player = player == 'X' ? 'O' : 'X'
  if turn.odd?
    puts "#{player}'s turn."
    table[player_choice - 1] = player
    return player
  else
    puts "#{other_player}'s turn."
    table[player_choice - 1] = other_player
  end
  
  board
end

def cpu_turn(table, player, turn)
  cpu_player = player == 'X' ? 'O' : 'X'
  if turn.even
  available_moves = table.select{ |x| x.is_a?Fixnum }
  puts "CPU's turn."
  table[available_moves.sample - 1] = cpu_player
  end
  table
end

def winner?(table)
  board = table
  WINS.any? do |i| 
  a = board[0] == board[1] && board[0] == board[2] || board[3] == board[4] && board[3] == board[5] ||
      board[6] == board[7] && board[6] == board[8]
  b = board[0] == board[3] && board[0] == board[6] || board[1] == board[4] && board[1] == board[7] ||
      board[2] == board[5] && board[2] == board[8]
  c = board[0] == board[4] && board[0] == board[8] || board[2] == board[4] && board[2] == board[6] 
  if a || b || c
    puts "Winner! Press Return to Exit"
    print_board(board)
    gets
  end
 end
end

def ttt_game(table)
  greeting
  turn_counter = 9
  player1 = choose_player
  mode = choose_mode 
  if mode == :human
      board = take_turn(table, turn_counter, player1)
      turn_count -= 1
  elsif mode == :cpu
      cpu_turn(table, player1, turn)
      turn_counter -= 1
  end# TODO: write a choose mode function!
  until winner?(table)
    print_board(table)
    # TODO: Fix this logic.
    if winner?(table) == true 
      return false
    end
    if turn_counter == 0
      print_board(table)
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
 
ttt_game(table)

  #cpu needs to be able to select different corresponding number and replace with O
  #easy, medium, hard, legendary	 
