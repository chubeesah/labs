
class Game
attr_reader :wins, :table, :turn_counter, :print_board
attr_accessor :choices, :choose_mode, :choose_player
include Enumerable
  
  def initialize (wins, choices, table, choose_mode, print_board, winner, choose_player)
  @wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
           [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3]]
  @choices = ('a'..'z').to_a
  @table = [1..9]
  @turn_counter = 9
  @choose_mode = choose_mode
  @print_board = print_board
  @winner = winner?
  @choose_player = choose_player
  end

  def print_board
    puts "
     #{@table[0]} | #{@table[1]} | #{@table[2]}
     #{@table[3]} | #{@table[4]} | #{@table[5]}
     #{@table[6]} | #{@table[7]} | #{@table[8]}"
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
    result = 1
  puts 'Choose a letter!'
  result = gets.chomp.upcase
    while @choices.include?(result)
      puts "That isn't a valid choice! (you chose #{result})"
      result = gets.chomp.upcase
    end
  result
  end

  def winner?
  board = @table
  @wins.any? do |i|
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
end

class Human
  attr_accessor :player1, :player2, :take_turn
  include Enumerable

  def initialize (player1, player2, take_turn)
    @player1 = player1
    @player2 = player2
    @take_turn = take_turn
  end
  
  def take_turn
    turn = @turn_counter
    player_choice = gets.chomp.to_i
    if turn.odd?
    puts "#{@player1}'s turn."
    @table[player_choice - 1] = @player1
    return player
    else
    puts "#{@player2}'s turn."
    @table[player_choice - 1] = @player2
    end

  end
end
   
class CPU
  attr_reader :cpu_player
  attr_accessor :player1, :cpu_turn
  include Enumerable

  def initialize (player, cpu_player, cpu_turn)
    @player1 = player1
    @cpu_player = cpu_player
    @cpu_turn = cpu_turn
  end

  def cpu_turn
    cpu_player = @player == 'C' ? 'X' : 'C'
    turn = @turn_counter
    if turn.odd?
    player_choice = gets.chomp.to_i
    puts "#{@player1}'s turn."
    @table[player_choice - 1] = player
    return player
    else
    puts "#{@cpu_player}'s turn."
    available_moves = @table.select { |x| x.is_a? Fixnum }
    @table[available_moves.sample - 1] = cpu_player
    end
  end
end



def greeting
  puts 'Welcome to Tic-Tac_Toe'
end

NEW = Game.new @wins, @choices, @table, @choose_mode, @print_board, @winner, @choose_player

PVP = Human.new @player1, @player2, @take_turn

COMP = CPU.new @cpu_player, @cpu_turn

def ttt_game
  greeting
  NEW
  NEW.turn_counter
  mode = NEW.choose_mode
  if mode == :human
    PVP
    PVP.player1 = NEW.choose_player
    PVP.player2 = NEW.choose_player
    until NEW.winner?
    NEW.print_board
    PVP.take_turn
    NEW.turn_counter -= 1
    end
  end
  if mode == :cpu
    COMP
    PVP.player1 = NEW.choose_player
    until NEW.winner?
    NEW.print_board
    COMP.cpu_turn
    NEW.turn_counter -= 1
    end
  end
  if NEW.turn_counter == 0
    NEW.print_board
    puts 'Its a Draw!'
    return false
  end
end

ttt_game
