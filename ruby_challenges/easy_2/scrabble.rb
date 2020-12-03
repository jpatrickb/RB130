# Write a program that, given a word, computes the scrabble score for that word.

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10



class Scrabble
  attr_reader :letters

  POINTS = {1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
            2 => ['D', 'G'], 3 => ['B', 'C', 'M', 'P'], 4 => ['F', 'H', 'V', 'W', 'Y'],
            5 => ['K'], 8 => ['J', 'X'], 10 => ['Q', 'Z']}

  def initialize(word)
    word = '' if word == nil
    @letters = word.chars.select { |letter| letter =~ /[A-Za-z]/ }
  end

  def self.score(word)
    Scrabble.new(word).score
  end
  
  def score
    tally = 0
    POINTS.each do |key, value|
      letters.each do |letter|
      tally += key if  value.include?(letter.upcase)
      end
    end
    tally
  end  
end

