class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = [] << factors
  end

  def add_factors(factors)
    @factors << factors
  end
end


class Palindromes
  attr_reader :max_factor, :min_factor, :palindromes

  def initialize(max_factor: nil, min_factor: 1)
    @min_factor = min_factor
    @max_factor = max_factor
    @palindromes = []
    
  end

  def generate
    (min_factor..max_factor).each do |num1|
      (min_factor..max_factor).each do |num2|
        if palindrome?(num1, num2) && @palindromes.count { |palindrome| palindrome.value == (num1 * num2)} == 0  
          @palindromes << Palindrome.new(num1*num2, [num1, num2])
        elsif palindrome?(num1, num2)
          palindrome = @palindromes.select { |palindrome| palindrome.value == (num1 * num2)}
          palindrome[0].add_factors([num1, num2].sort) unless palindrome[0].factors.include?([num1, num2].sort)
        end
      end
    end
    nil
  end

  def largest
    @palindromes.sort { |a, b| a.value <=> b.value }.last
  end

  def smallest
    @palindromes.sort { |a, b| a.value <=> b.value }.first
  end

  private

  def palindrome?(num1, num2)
    number = (num1 * num2)
    number.to_s == number.to_s.reverse
  end

end






