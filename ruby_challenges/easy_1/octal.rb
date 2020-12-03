class Octal
  attr_reader :octal_array
  
  def initialize(octal)
    loop do
      octal[0] = '' if octal[0] == '0'
      break if octal[0] != '0'
    end
    octal = 0 if octal.to_i.to_s != octal 
    octal = octal.to_i
    @octal_array = octal.digits
  end

  def to_decimal
    return 0 if octal_array.first == 8 || octal_array.first == 9
    multiplied_array = []
    octal_array.each_with_index do |digit, exponent|
      multiplied_array << digit * (8**exponent)
    end
    
    multiplied_array.reduce(:+)
  end

end

