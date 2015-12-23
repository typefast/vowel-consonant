module Summable
  def sum
    inject(:+)
  end
end

class Array 
  include Summable
end

class Range
  include Summable
end

class VowelFinder
  include Enumerable
  include Summable
  
  def initialize(string)
    @string = string
  end
  
  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

vf = VowelFinder.new("the quick brown fox jumped")

p vf.sum

class ConsonantFinder
  include Enumerable
  include Summable
  
  def initialize(string)
    @string = string
  end
  
  def each 
    @string.scan(/[^aeiou\s]/) do |consonant|
      yield consonant
    end
  end
end

cs = ConsonantFinder.new("the quick brown fox jumped")
p cs.sum