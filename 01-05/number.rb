puts "Guess a Number between 1 and 100"
answer = gets.to_i
number = rand(1..100)
until number == answer do
  if number > answer then puts "too low"
  elsif number < answer then puts "too high" 	
 end
 answer = gets.to_i
end
puts "Correct"

#Question 1: 'cowsay', 'uptime', and 'trace'
#'cowsay' was an entertaining picture of a cow that you can make say something via a thought or speech bubble. 'uptime' displays the amount of time spent on the particular terminal session from what I understood. 'trace's manual made me think I was reading an alien language.
#I did the command uptime, and it worked very well.

#Question 2: Symbols are immutable, strings are not.
#chunk(initial_state) { |elt, state| ... } → an_enumerator 
#it chunks items together that have the same 'block' value. I don't know what that means, so I can't really say when it would be useful. Judging by how it looks, using numbers as an example, it bundles numbers in groups based on a particular 'block' that they share. 