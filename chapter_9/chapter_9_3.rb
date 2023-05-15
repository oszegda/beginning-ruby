# frozen_string_literal: true

# Basic Databases
# Reading and Searching CSV Data

require 'csv'
CSV.open('chapter_9/text_2.txt').each do |person|
  p person
end

people = CSV.parse(File.read('chapter_9/text_2.txt'))
puts people[0][0]
puts people[1][0]
puts people[2][0]

p CSV.read('chapter_9/text_2.txt')

people = CSV.read('chapter_9/text_2.txt')
laura = people.find { |person| person[0] =~ /Laura/ }
p laura

young_people = people.find_all do |p|
  p[3].to_i.between?(20, 40)
end
p young_people

# Saving Data Back to the CSV File

#laura[0] = 'Lauren Smith'

CSV.open('chapter_9/text_2.txt', 'w') do |csv|
  people.each do |person|
    csv << person
  end
end

# PStore

# Top-level documentation
class Person
  attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = 'Fred Bloggs'
fred.age = 45

kate = Person.new
kate.name = 'Kate Smith'
kate.age = 23

require 'pstore'

store = PStore.new('storagefile')
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << kate
end

store = PStore.new('storagefile')
people = []
store.transaction do
  people = store[:people]
end

# At this point the Person objects inside people can be treated
# as totally local objects.

people.each do |person|
  puts person.name
end

# YAML

require 'yaml'

# Top-level documentation
class Person
  attr_accessor :name, :age
end

fred = Person.new
fred.name = 'Fred Bloggs'
fred.age = 45

laura = Person.new
laura.name = 'Laura Smith'
laura.age = 23
test_data = [fred, laura]
puts test_data.to_yaml

yaml_string = <<END_OF_DATA
  ---
    - !ruby/object:Person
      name: Fred Bloggs
      age: 45
    - !ruby/object:Person
      name: Laura Smith
      age: 23
END_OF_DATA
test_data = YAML.load(yaml_string)
puts test_data[0].name
puts test_data[1].name
