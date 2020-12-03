# Write a method that takes an optional block. If the block is specified, the method should 
# execute it, and return the value returned by the block. If no block is specified, the 
# method should simply return the String 'Does not compute.'.


def compute
  return yield if block_given?
  'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'


# Modify the compute method so it takes a single argument and yields that argument to the 
# block. Provide at least 3 examples of calling this new version of compute, including a 
# no-block call.

def argument_compute(argument)
  return "Does not compute." unless block_given?
  yield(argument)
end

p argument_compute('Juniper') { |word| "Jennifer #{word}." }
p argument_compute(21) { |num| "Your number is #{num}" }
p argument_compute(:goonies)
