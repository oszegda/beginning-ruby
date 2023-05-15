# frozen_string_literal: true

# Distributing Ruby Code and Libraries
# Easy on Detection with RUBY_PLATFORM

if RUBY_PLATFORM =~ /win32/
  puts "We're in Windows!"
elsif RUBY_PLATFORM =~ /linux/
  puts "We're in Linux!"
elsif RUBY_PLATFORM =~ /darwin/
  puts "we're in Mac OS X!"
elsif RUBY_PLATFORM =~ /freebsd/
  puts "We're in FreeBSD!"
else
  puts "we're running under an unknown operating system."
end

# Environment Variable

pp ENV.each { |e| puts e.join(': ') }

tmp_dir = '/tmp'
if ENV['OS'] =~ /Windows_NT/
  puts "This program is running under Windows NT/2000/XP!"
  tmp_dir = ENV['TMP']
elsif ENV['PATH'] =~ /\/usr/
  puts "This program has access to a UNIX-style file system!"
else
  puts "I cannot figure out what environment I'm running in!"
  exit
end

# Accessing Command-Line Arguments

# cp /directory1/from_filename /directory2/destination_filename
# #!/usr/bin/env ruby
# from_filename = ARGV[0]
# destination_filename = ARGV[1]

# Creating a Gem

require 'string_extend'


puts "This is a test"