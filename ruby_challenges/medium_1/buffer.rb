class CircularBuffer
  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end

  attr_reader :buffer

  def initialize(size)
    @max_size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer == []
    @buffer.shift
  end

  def write(object)
    return if object.nil?
    raise BufferFullException if @buffer.size == @max_size
    @buffer << object
  end

  def write!(object)
    return if object.nil?
    @buffer.shift if buffer.size == @max_size
    @buffer << object
  end

  def clear
    @buffer = []
  end

end

