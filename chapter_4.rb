# frozen_string_literal: true

# Developing My First Ruby Application

# Required Basic Features:
#  - Character count
#  - Character count (excluding spaces)
#  - Line count
#  - Word count
#  - Sentence count
#  - Paragraph count
#  - Average number of words per sentence
#  - Average number of sentences per paragraph

# Basic steps:
# 1. Load a file containing the text or document you want to analyze.
# 2. As you load the file line by line, keep a count of how many lines there were (one of your statistics taken care of).
# 3. Put the text into a string and measure its length to get your character count.
# 4. Temporarily remove all whitespace and measure the length of the resulting string to get the character count excluding spaces.
# 5. Split out all the whitespace to find out how many words there are.
# 6. Split on full stops to find out how many sentences there are.
# 7. Split on double newlines to find out how many paragraphs there are.
# 8. Perform calculations to work out the averages.

# Loading Text Files and Counting Lines
text = ""
line_count = 0
File.open('text.txt').each do |line|
  line_count += 1
  text += line
end
puts "#{line_count} lines"

# or

# Simpler way

lines = File.readlines('text.txt')
line_count = lines.size
text = lines.join

puts "#{line_count} lines"

# Counting Characters

total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters (excluding spaces)"

# Counting Words

word_count = text.split.length
puts "#{word_count} words"

# Counting Sentences and Paragraphs

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

# Calculating Averages

puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
