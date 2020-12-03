# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that 
# contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" 
# the program should return a list containing "inlets". Please read the test suite for exact rules of 
# anagrams.

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(array)
    result = []
    array.each do |string|
      next if string.downcase == word.downcase

      result << string if anagram?(string)
    end
    result
  end

  private
  
  def anagram?(string)
    word.downcase.chars.sort == string.downcase.chars.sort
  end

end
