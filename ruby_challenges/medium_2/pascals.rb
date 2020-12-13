class Triangle
  attr_reader :rows

  def initialize(size)
    @size = size
    @rows = [[1]]
    self.make_rows
  end

  private
  
  def make_row
    row = []
    (0..(rows[-1].size)).each do |index|
      if index == 0 || index == rows.size
        num = 1
        row << num
      else
        num = rows[-1][index - 1] + rows[-1][index]
        row << num
      end
    end
    row
  end

  def make_rows
    (@size - 1).times do |row|
      @rows << self.make_row
    end
  end

end


