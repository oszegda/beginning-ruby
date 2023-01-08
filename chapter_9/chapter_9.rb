# frozen_string_literal: true

# Files and Databases
# Input and Output
# Keyboard Input

#a = gets
#puts a

#line = readline
#puts line.length

# I/O
# Opening and Reading Files

File.open('text.txt').each { |line| puts line }

File.new('text.txt', 'r').each { |line| puts line }

File.open('text.txt') do |f|
  puts f.gets
end

f = File.new('text.txt', 'r')
puts f.gets
f.close

# Top-level documentation
class MyFile
  attr_reader :handle

  def initialize(filename)
    @handle = File.new(filename, 'r')
  end

  def finished
    @handle.close
  end
end

f = MyFile.new('text.txt')
puts f.handle.gets
f.finished

# More File Reading Techniques

File.open('chapter_9/text_2.txt').each { |line| puts line}

File.open('chapter_9/text_2.txt').each(',') { |line| puts line }

File.open('chapter_9/text_2.txt').each_byte { |byte| puts byte }

File.open('chapter_9/text_2.txt').each_char { |byte| puts byte }

File.open('chapter_9/text_2.txt') do |f|
  2.times { puts f.gets }
end

File.open('chapter_9/text_2.txt') do |f|
  2.times { puts f.gets(',') }
end

File.open('chapter_9/text_2.txt') do |f|
  2.times { puts f.getc }
end

puts File.open('chapter_9/text_2.txt').readlines.join('--')

File.open('chapter_9/text_2.txt') do |f|
  puts f.read(6)
end
# alternative methods
data = File.read('chapter_9/text_2.txt')
array_of_lines = File.readlines('chapter_9/text_2.txt')

# Your Position Within a File

f = File.open('chapter_9/text_2.txt')
puts f.pos
puts f.gets
puts f.pos

f = File.open('chapter_9/text_2.txt')
f.pos = 8
puts f.gets
puts f.pos

# Writing to Files

File.open('chapter_9/text_3.txt', 'w') do |f|
  f.puts 'This is a test'
end

f = File.open('chapter_9/logfile.txt', 'a')
f.puts Time.now
f.close