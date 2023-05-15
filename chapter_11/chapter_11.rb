# frozen_string_literal: true

# Advanced Ruby Features
# Dynamic Code Execution

eval 'puts 2 + 2'

puts eval '2 + 2'

my_number = 15
my_code = %{#{my_number} * 2}
puts eval(my_code)

# Bindings

def binding_elsewhere
  x = 20
  return binding
end

remote_binding = binding_elsewhere
x = 10
eval('puts x')
eval('puts x', remote_binding)

eval('x = 10')
eval('x = 50', remote_binding)
eval('puts x')
eval('puts x', remote_binding)

# Other Forms of eval

class Person
end

def add_accessor_to_person(accessor_name)
  Person.class_eval %{
  attr_accessor :#{accessor_name}
  }
end

person = Person.new
add_accessor_to_person :name
add_accessor_to_person :gender
person.name = 'Carleton DiLeo'
person.gender = 'male'
puts "#{person.name} is #{person.gender}"

# Top-level documentation
class Class
  def add_accessor(accessor_name)
    self.class_eval %{
      attr_accessor :#{accessor_name}
    }
  end
end

class Person
end

person = Person.new
Person.add_accessor :name
Person.add_accessor :gender
person.name = 'Harrison Ford'
person.gender = 'male'
puts "#{person.name} is #{person.gender}"

# Top-level documentation
class MyClass
  def initialize
    @my_variable = 'Hello, world!'
  end
end

obj = MyClass.new
obj.instance_eval { puts @my_variable }

# Creating Your Own Version of attr_accessor

# Top-level documentation
class Person
  def class_name
    @name
  end

  def name=(name)
    @name = name
  end
end

class Person
  attr_accessor :name
end

# Top-level documentation
class Class
  def add_accessor(accessor_name)
    self.class_eval %{
    def #{accessor_name}
      @#{accessor_name}
  end

  def #{accessor_name}=(value)
     @#{accessor_name} = value
  end
 }
  end
end

# Getting Results from Other Programs

x = system('ls')
x = `ls`

# Transferring Execution to Another Program

# exec 'chapter_4/text_analyzer.rb'
puts 'This will never be displayed'

# Running Two Programs at the Same Time

# if fork.nil?
#  exec 'ruby some_other_file.rb'
# end
puts 'This Ruby script now runs alongside some_other_file.rb'

child = fork do
  sleep 3
  puts "Child says 'hi'!"
end

puts "Waiting for the child process..."
Process.wait child
puts 'All done!'

# Interacting with Another Program

ls = IO.popen('ls','r')
while line = ls.gets
  puts line
end
ls.close

handle = IO.popen('ls', 'r+')
handle.puts 'send input to other program'
handle.close_write
while line = handle.gets
  puts line
end
