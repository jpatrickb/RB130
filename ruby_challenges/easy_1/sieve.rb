class Sieve
  attr_reader :range

  def initialize(limit)
    raise ArgumentError if limit < 2
    @range = (2..limit).to_a
  end

  def primes
    primes = range.dup
    primes.each do |prime|
      primes.reject! { |num| (num != prime) && (num % prime == 0) }
    end
  end
end


