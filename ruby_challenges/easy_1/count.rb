# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should 
# get:

# olly: 2
# in: 1
# come: 1
# free: 1

class Phrase
  
  def initialize(phrase)
    @phrase = phrase.scan(/[a-z]+'?[a-z]+|\d+/i)
  end

  def word_count
    counts = Hash.new(0) 
    words = @phrase.map(&:downcase) 
    words.each { |word| counts[word] += 1 }
    counts
  end

end