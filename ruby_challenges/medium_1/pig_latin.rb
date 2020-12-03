# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple 
# rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native 
#   speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an 
# "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants too.

class PigLatin

  def self.translate(string)
    if string =~ / /
      array = string.split
      array.map do |word|
        self.translate_word(word)
      end.join(' ')
    else
      self.translate_word(string)
    end
  end

  private

  def self.translate_word(word)
    if word =~ /(^[aeiou]|^xr|^yt)/
      word + 'ay'
    elsif word =~ /(^squ|^thr|^sch)/
      word[3..-1] + word[0..2] + 'ay'
    elsif word =~ /(^ch|^qu|^th)/
      word[2..-1] + word[0..1] + 'ay'
    elsif word =~ /(^ye|^xe|^[^aeiou])/
      word[1..-1] + word[0] + 'ay'
    end
  end
end