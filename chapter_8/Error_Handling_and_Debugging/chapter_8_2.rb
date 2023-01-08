# frozen_string_literal: true

# Debugging and Errors
# Raising Exceptions

# top-level documentation
class Person
  def initialize(name)
    raise ArgumentError, 'No name present' if name.empty?
  end
end

#fred = Person.new('')

class BadDataException < RuntimeError
end

# top-level documentation
class Person
  def initialize(name)
    raise BadDataException, 'No name present' if name.empty?
  end
end

#fred = Person.new('')

# Handling Exceptions

begin
  puts 10 / 0
rescue
  puts 'You caused an error!'
end

# Example
# data = ""
# begin
#   <..code to retrieve the contents of a Web page..>
#   data = <..content of Web page..>
# rescue
#   puts "The Web page could not be loaded! Using default data instead."
#   data = <..load datafrom local file..>
# end
# puts data
#
# Example 2
# begin
#   ...code here...
# rescue ZeroDivisionError
#   ...code to rescue the zero division exception here...
# rescue YourOwnException
#   ...code to rescue a different type vof exception here...
# rescue
#   ...code that rescue all other types of exception here...
# end

# Handling Passed Exception

begin
  puts 10 / 0
rescue => e
  puts "You caused the error -> #{e.class}"
end

# Catch and Throw

catch(:finish) do
  1000.times do
    x = rand(1000)
    throw :finish if x == 123
  end

  puts 'Generated 1000 random numbers without generating 123!'
end

def generate_random_number_except_123
  x = rand(1000)
  throw :finish if x > 123 && x < 200
end

catch(:finish) do
  1000.times { generate_random_number_except_123 }
  puts 'Generated 1000 random numbers without generating 123!'
end



