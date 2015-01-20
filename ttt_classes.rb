class Game
attr_reader :turn 
attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], 
       [3, 6, 9], [1, 5, 9], [7, 5, 3]]
    @choices = ('A'..'Z').to_a
    @board = (1..9).to_a
    @turn = 9
  end

  def choose_player
    puts 'Choose a letter!'
    result = gets.chomp.upcase
    until @choices.include?(result)
      puts "That isn't a valid choice! (you chose #{result})"
      result = gets.chomp.upcase
    end
    result
  end

  def take_turn
    player_choice = gets.chomp.to_i
      @turn -= 1
      if @turn.even?
        puts "#{@player1}'s turn."
        @board[player_choice - 1] = @player1
        return @player1
      else
        puts "#{@player2}'s turn."
        @board[player_choice - 1] = @player2
        return @player2
      end
  end

  def cpu_turn
    cpu_player = @player1 == 'C' ? 'X' : 'C'
    @turn -= 1
    if @turn.even?
      player_choice = gets.chomp.to_i
      puts "#{@player1}'s turn."
      @board[player_choice - 1] = @player1
      return @player1
    else
      puts "#{cpu_player}'s turn."
      available_moves = @board.select { |x| x.is_a? Fixnum }
      @board[available_moves.sample - 1] = cpu_player
    end
  end

  def draw
    @turn.zero?
  end

  def print_board
    puts "
      #{@board[0]} | #{@board[1]} | #{@board[2]}
      #{@board[3]} | #{@board[4]} | #{@board[5]}
      #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def winner
    @wins.any? do |i|
  a = @board[0] == @board[1] && @board[0] == @board[2] || @board[3] == @board[4] && @board[3] == @board[5] || 
  @board[6] == @board[7] && @board[6] == @board[8]  
  b = @board[0] == @board[3] && @board[0] == @board[6] || @board[1] == @board[4] && @board[1] == @board[7] || 
  @board[2] == @board[5] && @board[2] == @board[8]
  c = @board[0] == @board[4] && @board[0] == @board[8] || @board[6] == @board[4] && @board[6] == @board[2]  
    if a || b || c
    puts "Winner! Press Return to Exit"
    @print_board
    gets
    end
   end
  end
end

class Players

  def initialize(human, cpu) 
    @choose_mode = choose_mode
  end

  def choose_mode
    puts 'PvP(1) PvC(2)?'
    result = gets.chomp.to_i
    if result == 1 
      :human  
    else
      :cpu
    end
  end
end
#===========================================
GAME = Game.new @player1, @player2
MODE = Players.new :human, :$cpu

def greeting
  puts 'Welcome to Tic-Tac_Toe'
end

def pvp
  GAME.player1 = GAME.choose_player
  GAME.player2 = GAME.choose_player
  until GAME.winner || GAME.draw
    GAME.print_board
    GAME.take_turn
  end
  if GAME.draw
    GAME.print_board
    puts "It's a Draw!"
  end 
end
  
def pvc
  GAME.player1 = GAME.choose_player
  until GAME.winner || GAME.draw
    GAME.print_board
    GAME.cpu_turn
  end
  if GAME.draw
    GAME.print_board
    puts "It's a Draw!"
  end 
end

def ttt_game
  greeting
  if MODE.choose_mode == :human
    pvp
  else
    pvc
  end
end

ttt_game


