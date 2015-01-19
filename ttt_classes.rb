class Game
attr_reader :print_board 
attr_accessor :choose_mode, :choose_player, :take_turn, :player1, :player2, :turn
include Enumerable

  def initialize(take_turn, player1, player2, print_board, choose_player, winner, cpu_turn, draw)
    @player1 = player1
    @player2 = player2
    @cpu_turn = cpu_turn
    @take_turn = take_turn
    @print_board = print_board
    @choose_player = choose_player
    @winner = winner
    @wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], 
       [3, 6, 9], [1, 5, 9], [7, 5, 3]]
    @choices = ('a'..'z').to_a
    @board = (1..9).to_a
    @turn = 9
    @draw = draw
  end

  def take_turn
    player_choice = gets.chomp.to_i
    until @winner
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
  end

  def draw
    if @turn == 0
      puts "It's a Draw!"
      return false
      gets
    end
  end
    
  def cpu_turn
    cpu_player = @player1 == 'C' ? 'X' : 'C'
    if @turn.odd?
    player_choice = gets.chomp.to_i
    puts "#{@player1}'s turn."
    @board[player_choice - 1] = @player1
    return player
    else
    puts "#{cpu_player}'s turn."
    available_moves = @board.select { |x| x.is_a? Fixnum }
    @board[available_moves.sample - 1] = cpu_player
    end
  end

  def print_board
    puts "
      #{@board[0]} | #{@board[1]} | #{@board[2]}
      #{@board[3]} | #{@board[4]} | #{@board[5]}
      #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def choose_player
    puts 'Choose a letter!'
    result = gets.chomp.upcase
    while @choices.include?(result)
      puts "That isn't a valid choice! (you chose #{result})"
      result = gets.chomp.upcase
    end
    result
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

  def draw
    if @turn == 0
      puts "It's a Draw!"
      return false
    end
  end

end

class Players
  attr_accessor :choose_mode
  include Enumerable
   
  def initialize(choose_mode)
    @choose_mode = choose_mode
  end

  def choose_mode()
    puts '#PvP(1) PvC(2)?'
    result = gets.chomp.to_i
    if result == 1 
      :human  
    else
      :cpu
    end
  end
end

def greeting
  puts 'Welcome to Tic-Tac_Toe'
end

NEW = Game.new @take_turn, @player1, @player2, @cpu_turn, @print_board, @choose_player, @winner, @draw

MODE = Players.new @choose_mode

def ttt_game
  greeting
  mode = MODE.choose_mode
  if mode == :human
    NEW.player1 = NEW.choose_player
    NEW.player2 = NEW.choose_player
    until NEW.winner || NEW.draw
      NEW.print_board
      NEW.take_turn
    end
    #NEW.cpu_turn
  end  
end

ttt_game