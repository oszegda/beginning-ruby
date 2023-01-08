# frozen_string_literal: true

# Modules, Namespaces, and Mix-Ins

def random #:nodoc: all
  rand(1_000_000)
end

def random #:nodoc: all
  rand(65..90).chr
end

puts random

# top-level documentation
module NumberStuff #:nodoc: all
  def self.random
    rand(1_000_000)
  end
end

# top-level documentation
module LetterStuff #:nodoc: all
  def self.random
    rand(65..90).chr
  end
end

puts NumberStuff.random
puts LetterStuff.random

# top-level documentation
module ToolBox #:nodoc: all
  class Ruler #:nodoc: all
    attr_accessor :length
  end
end

# top-level documentation
module Country #:nodoc: all
  class Ruler #:nodoc: all
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = 'Genghis Khan from Moskau'

# top-level documentation
module UsefulFeatures #:nodoc: all
  def class_name
    self.class.to_s
  end
end

class Person #:nodoc: all
  include UsefulFeatures
end

x = Person.new
puts x.class_name

# top-level documentation
module AnotherModule #:nodoc: all
  def do_stuff
    puts 'This is a test'
  end
end

include AnotherModule
do_stuff
AnotherModule.do_stuff

# Enumerable

my_array = %w[this is a test of the longest word check]
longest_word = ''
my_array.each do |word|
  longest_word = word if longest_word.length < word.length
end

puts longest_word

scnd_my_array = %w[10 56 92 3 49 588 18]
highest_number = 0
scnd_my_array.each do |number|
  number = number.to_i
  highest_number = number if highest_number < number
end
puts highest_number

puts [1, 2, 3, 4].collect { |i| i.to_s + 'x' }
puts [1, 2, 3, 4].detect { |i| i.between?(2, 3) }
puts [1, 2, 3, 4].select { |i| i.between?(2, 3) }
puts [4, 2, 1, 3].sort
puts [1, 2, 3, 4].max
puts [1, 2, 3, 4].min

# top-level documentation
class AllVowels #:nodoc: all
  VOWELS = %w[a e i o u]

  def each
    VOWELS.each { |v| yield v}
  end
end

x = AllVowels.new
x.each { |v| puts v}

# top-level documentation
class AllVowels #:nodoc: all
  include Enumerable

  VOWELSS = %w[a e i o u]

  def each
    VOWELSS.each { |v| yield v}
  end
end

x = AllVowels.new
puts x.collect { |i| i + 'x'}
puts x.detect { |i| i > 'j'}
puts x.select { |i| i > 'j'}
puts x.sort
puts x.max
puts x.min

# Comparable

puts 1 <=> 2
puts 1 <=> 1
puts 2 <=> 1

# top-level documentation
class Song #:nodoc: all
  include Comparable

  attr_accessor :length

  def <=>(other)
    @length <=> other.length
  end

  def initialize(song_name, length)
    @song_name = song_name
    @length = length
  end
end

a = Song.new('Rock around the clock', 143)
b = Song.new('Bohemian Rhapsody', 544)
c = Song.new('Minute Waltz', 60)

puts a < b
puts b >= c
puts c > a
puts a.between?(c, b)

# Using Mix-Ins with Namespaces and Classes

module Toolbox #:nodoc: all
  class Ruler #:nodoc: all
    attr_accessor :length
  end
end

module Country #:nodoc: all
  class Ruler #:nodoc: all
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = 'Genghis Khan of Moskau'

include Country
c = Ruler.new
c.name = 'King Henry VIII'