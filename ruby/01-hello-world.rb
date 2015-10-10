# Basic version - constraint is to keep the input, string concat, and output
# separate
puts "What is your name?"
name = gets.chomp
greeting = "Hello, #{name}, nice to meet you!"
puts greeting

# Challenge 1 - no variables
puts "What is your name?"
puts "Hello, #{gets.chomp}, nice to meet you!"

# Challenge 2 - greeting differs by person
puts "What is your name?"
name = gets.chomp
if name.downcase == "josh"
  greeting = "Welcome back, #{name}"
elsif name.empty?
  greeting = "Oh, the strong, silent type, eh?"
else
  greeting = "Hello, #{name}, nice to meet you!"
end
