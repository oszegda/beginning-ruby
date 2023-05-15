# frozen_string_literal: true

# File Operations
# Creating Filenames Platform Independently

p File.join('full', 'path', 'here', 'filename.txt')
# full/path/here/filename.txt -> UNIX-style

p File.join(File::SEPARATOR, 'full', 'path', 'here', 'filename.txt')
# full/path/here/filename.txt

p File.expand_path('text.txt')
# /home/ola/dev/beginning-ruby/text.txt

# Seeking

f = File.open('text.txt', 'r+')
f.seek(-5, IO::SEEK_END)
f.putc 'X'
f.close

f = File.open('text.txt', 'r')
while a = f.getc
  puts a.chr
  f.seek(5, IO::SEEK_CUR)
end

# Finding Out When a File Was Last Modified

puts File.mtime('text.txt')

t = File.mtime('chapter_9/logfile.txt')
puts t.hour
puts t.min
puts t.sec

# Checking Whether a File Exists

puts 'It exists!' if File.exist?('text.txt')

# Top-level documentation
class MyFile
  attr_reader :handle

  def initialize(filename)
    if File.exist?(filename)
      @handle = File.new(filename, 'r')
    else
      return false
    end
  end
end
# Getting the Size of a File

puts File.size('text.txt')

# How to Know When You're at the End of a File

f = File.new('text.txt', 'r')
while !f.eof?
  puts f.gets
end
f.close

# Directories
# Navigating Through Directories

Dir.chdir('/usr/bin')
puts Dir.pwd

current = Dir.pwd
Dir.chdir('/usr/bin')
puts Dir.pwd

Dir.chdir(current)
puts Dir.pwd

puts Dir.entries('/home/ola').join(' ')

Dir.foreach('/home/ola') do |entry|
  puts entry
end

puts Dir['/home/ola/*']

# Creating a Directory

Dir.mkdir('mynewdir')
 Dir.mkdir('/mynewdir')

# Deleting a Directory

 Dir.delete('mynewdir')

require 'fileutils'
#FileUtils.rm_f(<directory_name>)

# Creating Files in the Temporary Directory

require 'tmpdir'
puts Dir.tmpdir

tempfilename = File.join(Dir.tmpdir, 'myapp.dat')
tempfile = File.new(tempfilename, 'w')
tempfile.puts 'This is only temporary'
tempfile.close
File.delete(tempfilename)

require 'tempfile'
f = Tempfile.new('myapp')
f.puts 'Hello'
puts f.path
f.close
