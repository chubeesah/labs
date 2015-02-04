require 'set'
require 'pry'

words = ['marksman', 'terminal', 'illness', 'capital', 'letter', 'martyr']

def greeting(turn, guess)
	do puts "Welcome to Hangman"
	   puts "Guess a letter."
	end
end

def game_over
	
end

def prompt_player
end	

def finished?(turns, guesses, answer)
	turns.zero? || answer.chars.all? { |l| guesses.include?(l) }
end

def hangman(words)
	turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
	guessed = Set.new
	answer = words.sample(1)[0]
	until finished?(turn_count, guessed, answer)
		guess = prompt_player
		guesses.add(guess)
	unless answer.include?(guess)
		turn_count -= 1
	take_turn
	end
end	

end