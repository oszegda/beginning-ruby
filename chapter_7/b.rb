# frozen_string_literal: true

# Basic inclusion

require_relative 'a'
puts 'Hello from b.rb'
require_relative 'a' # will not occur
puts 'Hello again from b.rb'

load 'chapter_7/a.rb'
puts 'Hello from b.rb'
load 'chapter_7/a.rb'
puts 'Hello again from b.rb'