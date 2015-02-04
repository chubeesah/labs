require 'pry'

BOARD = (1..9).to_a
WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]

def greeting
  puts "Welcome to Tic Tac Toe"
end

def print_board
  puts "
     #{BOARD[0]} | #{BOARD[1]} | #{BOARD[2]}
     #{BOARD[3]} | #{BOARD[4]} | #{BOARD[5]}
     #{BOARD[6]} | #{BOARD[7]} | #{BOARD[8]}"
end

def take_turn(board, player)
  player_choice = gets.chomp.to_i
  if player.odd?
    puts "X's turn."
    BOARD[player_choice - 1] = 'X'
  else
    puts "O's turn."
    BOARD[player_choice - 1] = 'O'
  end
end

def winner?
  board = BOARD
  WINS.any? do |i|
    a = board[0] == board[1] && board[0] == board[2] || board[3] == board[4] && board[3] == board[5] ||
        board[6] == board[7] && board[6] == board[8]
    b = board[0] == board[3] && board[0] == board[6] || board[1] == board[4] && board[1] == board[7] ||
        board[2] == board[5] && board[2] == board[8]
    c = board[0] == board[4] && board[0] == board[8] || board[2] == board[4] && board[2] == board[6] 
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
  until winner? == true 
    print_board
    table = take_turn(table, turn_counter)
    turn_counter -= 1
    if turn_counter == 0
      puts "It's a Draw!"
      print_board
      return false
    end
  end
end    

ttt_game
