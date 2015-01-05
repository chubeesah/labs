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