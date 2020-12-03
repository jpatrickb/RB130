# Write a method that takes a sorted array of integers as an argument, and returns an array 
# that includes all of the missing integers (in order) between the first and last elements 
# of the argument.

def missing(sorted_arr)
  result = []
  (sorted_arr[0]..sorted_arr[-1]).each do |num|
    result << num if !sorted_arr.include?(num)
  end
  result
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []

#ls solution:
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# Can you find other ways to solve this problem? What methods might prove useful? Can you 
# find a way to solve this without using a method that requires a block?

