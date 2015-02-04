## BEWARE THE SEMICOLON!

require 'pry'
require 'set'

words = ['angus',
         'onomatopeia',
         'mississippi',
         'cookies',
         'terminal',
         'illness',
         'communist',
         'dictator',
         'capitalist',
         'marxist',
         'darwinism']

def finished? (turns, guesses, answer)
  turns.zero? || answer.chars.all? { |l| guesses.include?(l) }
end

def win?(answer, guessed)
  answer.chars.all? { |x| guessed.include?(x)}


end

def display_guesses(guesses, answer)
  # TODO: check each character print if if guessed, print '-' otherwise
  answer.each_char do |c|
    if guesses.include?(c)
      print(c)
    else
      print "-"
    end
  end
end 

def greeting
  puts "Welcome to Hangman"
end

def game_over(answer, guessed)
  print answer

    if win?(answer, guessed) then puts " was correct! Congratulations! You solved the puzzle!"
    else 
      puts " was the answer. You have failed!"
    end
end

def prompt_player(guesses, answer)
  display_guesses(guesses, answer)
  puts " Guess a letter"
  gets.chomp
end



def hangman(words)
  
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  greeting 
  until finished?(turn_count, guessed, answer)
    guess = prompt_player(guessed, answer)
    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over(answer, guessed) 
  # TODO: Do I need an argument?
end
  
hangman(words)
 
