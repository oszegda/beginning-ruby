# frozen_string_literal: true

# Basic inclusion
require './chapter_7/string_extension'
puts 'This is a test'.vowels.join('-')

require_relative 'string_extension'
puts 'This is a test'.vowels.join('-')

# Inclusions from Other Directories

$:.each { |d| puts d}
$:.push '/home/ola/dev/Dungeon-Text-Adventure-with-Objects'
require 'Dungeon_Text_Adventure'

# Logic and Including Code

$debug_mode = 0
#require_relative $debug_mode == 0 ? 'normal-classes' : 'debug-classes'

#%w[file1 file2 file3 file4 file5].each {|file| require file}

# Nested Inclusions
require_relative 'f'

# Libraries
# net/http

require 'net/http'
uri = URI('https://ruby-doc.org')
http_request = Net::HTTP.new(uri.host, uri.port)
http_request.use_ssl = true
response = http_request.get('/')
puts response.body.force_encoding('ISO-8859-1')

require 'net/http'
url = URI.parse('https://ruby-doc.org/')
response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
  http.get(url.path)
end
content = response.body

# Open Struct

Person = Struct.new(:name, :age)
me = Person.new('Fred Bloggs', 25)
me.age += 1

require 'ostruct'
person = OpenStruct.new
person.name = 'Fred Bloggs'
person.age = 25

# RubyGems
# Using Gems

require 'chronic'
puts Chronic.parse('may 10th')






