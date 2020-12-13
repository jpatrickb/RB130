# The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each 
# as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the 
# sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the 
# number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

# Write a program that can tell if a number is perfect, abundant or deficient.

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 0
    case 
    when self.perfect?(number) then 'perfect'
    when self.abundant?(number) then 'abundant'
    when self.deficient?(number) then 'deficient'
    end
  end

  def self.perfect?(number)
    self.factors(number).sum == number
  end

  def self.abundant?(number)
    self.factors(number).sum > number
  end

  def self.deficient?(number)
    self.factors(number).sum < number
  end

  def self.factors(number)
    1.upto(number / 2).select { |num| number % num == 0}
  end
      
end