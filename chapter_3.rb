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


