# Basic version, restriction to not use string interpolation
puts "What is the quote?"
quote = gets.chomp
puts "Who said it?"
quoter = gets.chomp
output = quoter+" says, \""+quote+"\""
puts output

# Challenge - use Data Structures (chap 7) to allow selection of quotes
quotes = {}
quotes["Obi Wan"] = "These aren't the droids you're looking for"
quotes["Beavis"] = "Butthead!"

puts "Please select a quote"

quotes.keys.each do |q|
  puts q
end
selection = gets.chomp
if quotes.key? selection
  puts "The wise #{selection} once said, \"#{quotes[selection]}\""
else
  puts "Error! You didn't select nothing! At all! How dare you!"
end
