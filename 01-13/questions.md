* Update your Hangman game to use classes.
  * Copy the file into the 01-13 directory of your labs.
  * Create a `class Hangman` with an initializer for
    any needed variables.
  * You should be able to have two Hangman instances
    with different words and play them "at the same time"
    by calling a `guess` or `take_turn` method.

## Hint:
Not everything *has* to go in the hangman class.
It would be reasonable to keep at least a wordlist
outside of it.

==================================================

This homework was not very well specified and I apologize for that.

Unlike the original hangman assignment, I am explicitly *NOT* interested in being able to run the assignment with "ruby your_file.rb" at the prompt to play a game of hangman.

Instead, I would like to be able to put a 'binding.pry' after your class definition and interact with your game in the interpreter. An example session might look as follows:

#> game1 = Hangman.new my_wordlist
=> #<Hangman...>

#> game1.take_turn
You have X turns left. Guess a letter! (_____)
'a'
There was 1 a: 

#> game2 = Hangman.new my_wordlist
#> #<Hangman...>

#> game1.turns_left
=> 6

#> game2.turns_left
=> 7

... and so on. This is much easier than you expected probably.
