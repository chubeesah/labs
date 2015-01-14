require 'pry'

TABLE = (1..9).to_a
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], 
       [3, 6, 9], [1, 5, 9], [7, 5, 3]]
# hash to board index stuff

def greeting
  puts 'Welcome to Tic Tac Toe' 
end

def choose_mode()
  puts '#PvP(1) or CPU(2)?'
  result = gets.chomp.to_i
    if result == 1 
      :human  
    else
      :cpu
  end
end

def choose_player
  puts 'Player 1: X or O?'
  result = gets.chomp.upcase
  until ['X', 'O'].include?(result)
    puts 'Not a choice. Pick again!'
    result = gets.chomp.upcase
  end
  result
end

def print_board
  puts "
     #{TABLE[0]} | #{TABLE[1]} | #{TABLE[2]}
     #{TABLE[3]} | #{TABLE[4]} | #{TABLE[5]}
     #{TABLE[6]} | #{TABLE[7]} | #{TABLE[8]}" 
end

def take_turn(turn, player)
  player_choice = gets.chomp.to_i
  other_player = player == 'X' ? 'O' : 'X'
  if turn.odd?
    puts "#{player}'s turn."
    TABLE[player_choice - 1] = player
    return player
  else
    puts "#{other_player}'s turn."
    TABLE[player_choice - 1] = other_player
  end
end

def cpu_turn(player, turn)
  cpu_player = player == 'X' ? 'O' : 'X'
  if turn.odd?
    player_choice = gets.chomp.to_i
    puts "#{player}'s turn."
    TABLE[player_choice - 1] = player
    return player
  else
    puts "#{cpu_player}'s turn."
    available_moves = TABLE.select { |x| x.is_a? Fixnum }
    TABLE[available_moves.sample - 1] = cpu_player
  end
end

def winner?
  board = TABLE
  WINS.any? do |i|
  a = board[0] == board[1] && board[0] == board[2] || board[3] == board[4] && board[3] == board[5] || 
  board[6] == board[7] && board[6] == board[8]  
  b = board[0] == board[3] && board[0] == board[6] || board[1] == board[4] && board[1] == board[7] || 
  board[2] == board[5] && board[2] == board[8]
  c = board[0] == board[4] && board[0] == board[8] || board[6] == board[4] && board[6] == board[2]  
    if a || b || c
    puts "Winner! Press Return to Exit"
    print_board
    gets
    end
  end
end

def ttt_game
  greeting
  turn_counter = 9
  player1 = choose_player
  mode = choose_mode 
    until winner?
      print_board
      if mode == :human
      take_turn(turn_counter, player1)
      turn_counter -= 1
      elsif mode == :cpu
      cpu_turn(player1, turn_counter)
      turn_counter -= 1
      end
      if turn_counter == 0
      print_board
      puts "Its a Draw!"
      return false
      end
  end
end 

 
ttt_game
  #easy, medium, hard, legendary	 
