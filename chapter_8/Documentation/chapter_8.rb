# frozen_string_literal: true

# Documentation, Error Handling, Debugging and Testing
# Generating Documentation with RDoc

# This class stores information about people.
# top-level documentation
class PersonCreator
  attr_accessor :name, :age, :gender

  # Create the person object and store their name
  def initialize(name)
    @name = name
  end

  # Print this person name to the screen
  def print_name
    puts "Person called #{@name}"
  end
end

# :nodoc: Modifier

# This is a class that does nothing
# top-level documentation
class AnotherMyClass
# This method is documented
  def some_method
  end
  def secret_method #:nodoc:
  end
end

# Turning RDoc processing On and Off
# This section is documented and read by RDoc
#--
# This section is hidden from RDoc and could contain developer
# notes, private messages between developers, etc.
#++
# RDoc begins processing again here after the ++.

