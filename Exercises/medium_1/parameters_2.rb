# Write a method that takes an array as an argument. The method should yield the contents of the array 
# to a block, which should assign your block variables in such a way that it ignores the first two 
# elements, and groups all remaining elements as a raptors array.

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield(birds)
end

types(birds) { |_, _, *raptors| puts raptors}