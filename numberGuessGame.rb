#!/usr/bin/env ruby


Answer = rand(10)
puts "Lets play Guess a number!\n"
puts "Make a Guess"
userAnswer = $stdin.gets.chomp.to_i

while userAnswer != Answer
puts "You chose too high" if userAnswer > Answer
puts "You chose too low" if userAnswer < Answer
$stdout.flush()
userAnswer = $stdin.gets.chomp.to_i
end
puts "You win the answe was #{Answer}"