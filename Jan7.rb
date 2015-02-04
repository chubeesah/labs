## BEWARE THE SEMICOLON!
require 'pry'
require 'set'

class Hangman
  attr_accessor :guesses, :win, :lose

  def initialize
    @turns = ARGV.empty? ? 6 : ARGV[0].to_i
    @answer = Words.sample
    @win = @answer.chars.all?
    @lose = turns.zero?
  end
end

Words = ['angus', 'master', 'onomatopeia', 'arbitrary',
         'mississippi', 'linked', 'sunburn', 'jealous',
         'cookies', 'marksman', 'battlefield', 'television', 
         'terminal', 'gifted', 'goodbye', 'popular',
         'illness', 'jacket', 'handsome', 'pleasure',
         'communist', 'blizzard', 'husky', 'likable',
         'dictator', 'building', 'lollipop', 'bottle',
         'capitalist', 'maximum', 'berserker', 'grandparent',
         'marxist', 'establishment', 'cartoon', 'daredevil',
         'darwinism', 'human', 'expansion', 'juxtaposition']

def finished? (guessed, answer)
  @lose || answer.chars.all? { |l| guessed.include?(l) }
end 

def greeting
  puts "Welcome to Hangman"
end
def display_guesses(guessed)
  answer.each_char do |c|
  if guessed.include?(c)
      print(c.upcase)
  else
      print "-"
  end
 end
end

def game_over(guessed)
  print @answer.upcase
    if @win then puts " was correct! Congratulations! You solved the puzzle!"
    else 
      puts " was the answer. You have failed!"
    end
end

def prompt_player(guesses)
  display_guesses(guesses, answer)
  puts " Guess a letter, you have #{count} guesses left!"
  gets.chomp
end

def hangman
  Hangman.new
  @turns
  guessed = Set.new
  @answer
  greeting 
  until finished?(guessed, @answer)
    guess = prompt_player(guessed)
    guessed.add(guess)
    unless @answer.include?(guess)
      @turns -= 1
    end
  end
  game_over(guessed) 
  # TODO: Do I need an argument?
end

hangman

 
