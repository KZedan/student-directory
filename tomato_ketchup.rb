
#source code yo!

puts "I like tomato ketchup"
puts "it's good with things like chips"

file = File.open($0, "r")
puts file.read
file.close
