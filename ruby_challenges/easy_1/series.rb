
class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(size)
    numbers = series.chars.map(&:to_i)
    raise ArgumentError, 'argument length greater than caller size' if size > numbers.size
    result = []
    numbers.each_index do |idx|
      result << create_slice(numbers, idx, size)
      break if idx + size == numbers.size
    end
    result
  end

  private

  def create_slice(numbers, idx, size)
    index = idx
    result = []
    size.times do 
      result << numbers[index]
      index += 1
    end
    result
  end
 
end


