# frozen_string_literal: true

# Classes, Objects and Modules

def perimeter_of_square(side_length)
  side_length * 4
end

def area_of_square(side_length)
  side_length * side_length
end

def perimeter_of_triangle(side1, side2, side3)
  side1 + side2 + side3
end

def area_of_triangle(base_width, height)
  base_width * height / 2
end

# Class method

class Shape
end

# top-level documentation
class Square < Shape
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end

  def perimeter
    @side_length * 4
  end
end

# top-level documentation
class Triangle < Shape
  def initialize(base_width, height, side1, side2, side3)
    @base_width = base_width
    @height = height
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def area
    @base_width * @height / 2
  end

  def perimeter
    @side1 + @side2 + @side3
  end
end

puts area_of_triangle(6, 6)
puts perimeter_of_square(5)

my_square = Square.new(5)
my_triangle = Triangle.new(6, 6, 7.81, 7.81, 7.81)

puts my_square.area
puts my_square.perimeter
puts my_triangle.area
puts my_triangle.perimeter

# Object Orientation Basics
# Local, Global, Object and Class Variables
# Instance or Object Variables - @side_length is instance variable

# top-level documentation
class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def are
    @side_length * @side_length
  end
end

a = Square.new(10)
b = Square.new(5)

puts a.area
puts b.area

# Local Variables

# def basic_method
#   puts x
# end

# x = 10
# basic_method
# -> basic_method': undefined local variable or method `x' for main:Object (NameError)

def basic_method
  x = 50
  puts x
end

x = 10
basic_method
puts x

# Global Variables

def basic_method
  puts $x
end

$x = 10
basic_method

# Class Variables

# top-level documentation
class Square
  def initialize
    if defined? @@number_of_squares
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end

  def self.count
    @@number_of_squares
  end
end

a = Square.new
b = Square.new
puts Square.count

# Class Methods vs. Instance Methods

# top-level documentation
class Square
  def self.test_method
    puts 'Hello from the Square class!'
  end

  def test_method
    puts 'Hello from an instance of class Square!'
  end
end

Square.test_method
Square.new.test_method

# top-level documentation
class Square
  def initialize
    if defined? @@number_of_squares
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end

  def self.count
    @@number_of_squares
  end
end

a = Square.new
puts Square.count
b = Square.new
puts Square.count
c = Square.new
puts Square.count

# Inheritance

# top-level documentation
class ParentClass
  def method1
    puts 'Hello from method1 in the parent class'
  end

  def method2
    puts 'Hello from method2 in the parent class'
  end
end

# top-level documentation
class ChildClass < ParentClass
  def method2
    puts 'Hello from method2 in the child class'
  end
end

my_object = ChildClass.new
my_object.method1
my_object.method2

# top-level documentation
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

# top-level documentation
class Doctor < Person
  def name
    'Dr. ' + super
  end
end

# Overriding Existing Methods

x = 'This is a test'
puts x.class

puts x.length
puts x.upcase

# top-level documentation
class String
  def length
    20
  end
end

puts 'This is a test'.length
puts 'a'.length
puts 'A really long line of text'.length

# top-level documentation
class Dog1
  def talk
    puts 'Woof!'
  end
end

my_dog = Dog1.new
my_dog.talk

# top-level documentation
class Dog1
  def talk
    puts 'Howl!'
  end
end

my_dog.talk

# Reflection and Discovering an Object's Methods

a = 'This is a test'
puts a.methods.join(' ')

# top-level documentation
class PersonClass
  attr_accessor :name, :age
end

p = PersonClass.new
p.name = 'Fred'
p.age = 20
puts p.instance_variables

# Encapsulation

# top-level documentation
class Person
  def initialize(name)
    set_name(name)
  end
  def name
    @first_name + ' ' + @last_name
  end

  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end

  def set_first_name(name)
    @first_name = name
  end

  def set_last_name(name)
    @last_name = name
  end
end

p = Person.new('Fred Bloggs')
puts p.name
p.set_last_name('Smith')
puts p.name

# After the encapsulation
# top-level documentation
class Person
  def initialize(name)
    set_name(name)
  end
  def name
    @first_name + ' ' + @last_name
  end

  private

  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end

  def set_first_name(name)
    @first_name = name
  end

  def set_last_name(name)
    @last_name = name
  end
end

p = Person.new('Fred Bloggs')
# p.set_last_name('Smith')
# -> private method `set_last_name' called for #<Person:0x00007f0ad7ef78b8 @first_name="Fred", @last_name="Bloggs"> (NoMethodError)

# top-level documentation
class Example
  def anyone_can_access_this

  end

  private
  def this_is_private

  end

  public
  def another_public_method

  end
end

# top-level documentation
class AnotherExample
  def anyone_can_access_this; end
  def this_is_privet; end
  def this_is_also_private; end
  def another_public_method; end

  private :this_is_privet, :this_is_also_private
end

# top-level documentation
class Person
  def initialize(age)
    @age = age
  end

  def age
    @age
  end

  def age_difference_with(other_person)
    (self.age - other_person.age).abs
  end

  protected :age
end

fred = Person.new(34)
chris = Person.new(25)
puts chris.age_difference_with(fred)
# puts chris.age
# -> protected method `age' called for #<Person:0x00007ff8810fdb48 @age=25> (NoMethodError)

# Polymorphism

# top-level documentation
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# top-level documentation
class Cat < Animal
  def talk
    'Meaow!'
  end
end

# top-level documentation
class Dog < Animal
  def talk
    'Woof!'
  end
end

animals = [Cat.new('Flossie'), Dog.new('Clive'), Cat.new('Max')]
animals.each do |animal|
  puts animal.talk
end

# Nested Classes

# top-level documentation
class Drawing
  def self.give_me_a_circle
    Circle.new
  end
  class Line
  end

  class Circle
    def what_am_i
      'This is a circle'
    end
  end
end

a = Drawing.give_me_a_circle
puts a.what_am_i
b = Drawing::Circle.new
puts b.what_am_i
# c = Circle.new
# puts c.what_am_i
# c -> uninitialized constant Circle (NameError)

# The Scope of Constants

def circumference_of_circle(radius)
  2 * Pi * radius
end

Pi = 3.141592
puts circumference_of_circle(10)

# top-level documentation
class OtherPlanet
  Pi = 4.5
  def self.circumference_of_circle(radius)
    2 * Pi * radius
  end
end

puts OtherPlanet.circumference_of_circle(10)
puts OtherPlanet::Pi
puts Pi