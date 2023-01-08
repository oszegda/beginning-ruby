# frozen_string_literal: true
# The Ruby Debugger

require 'byebug'
i = 1
j = 0
byebug
until i  > 1_000_000
  i *= 2
  j += 1
end
puts "i = #{i}, j = #{j}"