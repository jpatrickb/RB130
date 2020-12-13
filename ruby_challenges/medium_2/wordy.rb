class WordProblem
  attr_reader :numbers, :operators
  
  COMPUTE = { 'plus' => :+, 'minus' => :-, 'multiplied' => :*, 'divided' => :/ }

  def initialize(problem)
    @numbers = problem.scan(/-?\d+/).map(&:to_i)
    @operators = problem.scan(/(plus|minus|multiplied|divided)/).flatten
    raise ArgumentError if @numbers.empty? || @operators.empty?
  end

  def answer
    compute(numbers, operators) 
  end

  private

  def compute(numbers, operators)
    if operators.size == 1 
      numbers[0].send(COMPUTE[operators[0]], numbers[1])
    else
      answer = numbers[0].send(COMPUTE[operators[0]], numbers[1])
      answer.send(COMPUTE[operators[1]], numbers[2])
    end
  end
end

