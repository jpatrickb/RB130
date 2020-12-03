# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for 
# a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and those who don't. You and 
# your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret 
# "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump

# 10000 = Reverse the order of the operations in the secret handshake.
#The program should consider strings specifying an invalid binary as the value 0.

class SecretHandshake
  OPERATIONS = ["wink", "double blink", "close your eyes", "jump"]
  
  def initialize(number)
    @binary = number.to_s(2).chars.reverse if number.class == Integer
    @binary = number.chars.reverse if number.class == String
  end

  def commands
    result = []
    return result if @binary.join =~/[^01]/
    size = @binary.size
    array = @binary
    
    array.each_with_index do |num, index|
      
      if num == '1'
        result << OPERATIONS[index] unless OPERATIONS[index] == nil
      else
        next
      end
    end
  
    return result.reverse if @binary.size == 5
    result
  end

end


# handshake = SecretHandshake.new 9
# p handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# p handshake.commands # => ["jump","wink"]
