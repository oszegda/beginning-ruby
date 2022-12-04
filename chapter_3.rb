# frozen_string_literal: true

# Hashes

x = { 'a' => 1, 'b' => 2 }
x.each do |key, value|
  puts "#{key} equals #{value}"
end

x = { a: 1, b: 2, c: 3 }
p x.keys

x = { a: 1, b: 2 }
x.delete(:a)
p x

x = { a: 100, b: 20 }
x.delete_if do |key, value|
  value < 25
end
p x

people = {
  fred: {
    name: 'Fred Elliott',
    age: 63,
    gender: 'male',
    favourite_painters: ['Monet', 'Constable', 'Da Vinci']
  },
  janet: {
    name: 'Janet S Porter',
    age: 55,
    gender: 'female'
  }
}
puts people[:fred][:age]
puts people[:janet][:gender]
puts people[:janet]
puts people[:fred][:favourite_painters].length
puts people[:fred][:favourite_painters].join(', ')

# Flow Control

age = 10
if age < 18
  puts "You're too young to use this system"
  puts "So we're going to exit your program now"
  # exit
end

age = 10
unless age >= 18
  puts "You're too young to use this system"
  puts "So we're going to exit your program now"
  # exit
end

age = 19
if age < 21
  puts "You can't drink in the most of United States"
  if age >= 18
    puts 'But You can in united Kingdom!'
  end
end

age = 10
if age < 18
  puts "You're too young to use this system"
else
  puts 'You can use this system'
end

age = 10
type = age < 18 ? 'child' : 'adult'
puts 'You are a ' + type

age = 10
type = 'child' if age < 18
type = 'adult' unless age < 18
puts 'You are a ' + type

age = 10
if age < 18
  type = 'child'
else
  type = 'adult'
end
puts 'You are a ' + type

age = 10
puts 'You are a ' + (age < 18 ? 'child' : 'adult')

fruit = 'orange'
color = 'orange' if fruit == 'orange'
color = 'green' if fruit == 'apple'
color = 'yellow' if fruit == 'banana'
puts color

fruit = 'orange'
if fruit == 'orange'
  color = 'orange'
elsif  fruit == 'apple'
  color = 'green'
elsif fruit == 'banana'
  color = 'yellow'
else
  color = 'unknown'
end
puts color

fruit = 'orange'
case fruit
when 'orange'
  color = 'orange'
when 'apple'
  color = 'green'
when 'banana'
  color = 'yellow'
else
  'unknown'
end

response = { error: 'Bad Gateway', code: 502 }
case response
in { data: data, code: code }
  puts "Success #{data}, Code: #{code}"
in { error: error, code: code }
  puts "Error: #{error}, Code: #{code}"
end

1.upto(5) { |number| puts number }

x = 1
while x < 100
  puts x
  x = x * 2
end

x = 1
until x > 99
  puts x
  x = x * 2
end

i = 1
i = i * 2 until i > 1000
puts i

x = [1, 2, 3]
x.each { |y| puts y }

x = [1, 2, 3]
x.each do |y|
  puts y
end

x = [1, 2, 3]
x.each do
  puts _1
end

def each_vowel(&code_block)
  %w{a e i o u}.each { |vowel| code_block.call(vowel) }
end

each_vowel {|vowel| puts vowel }

def each_vowel
  %w{a e i o u}.each { |vowel| yield vowel }
end
each_vowel { |vowel| puts vowel}

print_parameter_to_screen = Proc.new { |x| puts x }
print_parameter_to_screen.call(100)