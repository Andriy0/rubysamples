require_relative "stack"

s = Stack.new
s.add_to_stack("item1")
s.add_to_stack("item2")
s.add_to_stack("item3")
puts "Objects currently on the stack:"
puts s.stack
taken = s.take_from_stack
puts "Removed object:"
puts taken
puts "Now on stack:"
puts s.stack
