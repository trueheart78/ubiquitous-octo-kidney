# Basic version, counting characters witha single output
puts "What is the input string?"
string = gets.chomp
puts "#{string} has #{string.length} characters."

# Require the user to enter something
puts "What is the input string?"
string = gets.chomp
if !string.strip.empty?
  puts "#{string} has #{string.length} characters."
else
  puts "You must enter something! *I'm exiting...*"
end

# Challenge 3 requires HTML + JS

# todo this
