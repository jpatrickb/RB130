def integer_reduce(array, acc = 0)
  array.each do |element|
    acc = yield(acc, element)
  end
  acc
end

array = [1, 2, 3, 4, 5]

p integer_reduce(array) { |acc, num| acc + num }                    # => 15
p integer_reduce(array, 10) { |acc, num| acc + num }                # => 25
#p integer_reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method  #`+' for nil:NilClass

def reduce(array, acc = array[0])
  array[1..-1].each do |element|
    acc = yield(acc, element)
  end
  acc
end


p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
                                                      