include "ttt_classes.rb"

def greeting
  puts 'Welcome to Tic-Tac_Toe'
end


def ttt_game
  Game.new
  greeting
  @turn_counter
  mode = @choose_mode
    if mode == :human
      Human.new
      player1 = choose_player
      player2 = choose_player
      until winner?
      print_board
      take_turn(turn_counter, player1, player2)
      turn_counter -= 1
     end
    end
    if mode == :cpu
      CPU.new
      player1 = choose_player
      until winner? 
      print_board
      cpu_turn(player1, turn_counter)
      turn_counter -= 1
     end
    end
      if turn_counter == 0
      print_board
      puts "Its a Draw!"
      return false
      end
end 