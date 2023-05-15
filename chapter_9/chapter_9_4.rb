# frozen_string_literal: true

# SQL
# CREATE TABLE

# CREATE TABLE people (
# id integer primary key,
# name varchar(50),
# job varchar(50),
# gender varchar(6),
# age integer);

# INSERT INTO
# INSERT INTO people (id, name, job, gender, age) VALUES (1, 'Chris Scott', 'Technician', 'Male', 25);
# INSERT INTO people(id, name, job, gender, age) VALUES (2, 'Emily Clark', 'Actress', 'Woman', 31);
# INSERT INTO people(id, name, job, gender, age) VALUES (3, 'Stephen King', 'Writter', 'Male', 54);
# INSERT INTO people(id, name, job, gender, age) VALUES (4, 'Mary Hoppkins', 'Singer', 'Woman', 19);

# SELECT
#
# SELECT * FROM people;
#  id |     name      |    job     | gender | age
# ----|---------------|------------|--------|-----
#   1 | Chris Scott   | Technician | Male   |  25
#   2 | Emily Clark   | Actress    | Woman  |  31
#   3 | Stephen King  | Writter    | Male   |  54
#   4 | Mary Hoppkins | Singer     | Woman  |  19
# (4 rows)
#
# SELECT name FROM people;
#      name
# ---------------
#  Chris Scott
#  Emily Clark
#  Stephen King
#  Mary Hoppkins
# (4 rows)
#
# SELECT * FROM people WHERE id = 2;
#  id |    name     |   job   | gender | age
# ----|-------------|---------|--------|-----
#   2 | Emily Clark | Actress | Woman  |  31
# (1 row)
#
# SELECT * FROM people WHERE name = 'Chris Scott';
#  id |    name     |    job     | gender | age
# ----|-------------|------------|--------|--------
#   1 | Chris Scott | Technician | Male   |  25
# (1 row)
#
# SELECT * FROM people WHERE age >= 20 AND age <= 40;
#  id |    name     |    job     | gender | age
# ----|-------------|------------|--------|--------
#   1 | Chris Scott | Technician | Male   |  25
#   2 | Emily Clark | Actress    | Woman  |  31
# (2 rows)
#
# SELECT * FROM people ORDER BY name DESC;
#  id |     name      |    job     | gender | age
# ----|---------------|------------|--------|---------
#   3 | Stephen King  | Writter    | Male   |  54
#   4 | Mary Hoppkins | Singer     | Woman  |  19
#   2 | Emily Clark   | Actress    | Woman  |  31
#   1 | Chris Scott   | Technician | Male   |  25
# (4 rows)
#
# SELECT * FROM people WHERE age >= 20 AND age <= 40 ORDER BY age ASC;
#  id |    name     |    job     | gender | age
# ----|-------------|------------|--------|--------
#   1 | Chris Scott | Technician | Male   |  25
#   2 | Emily Clark | Actress    | Woman  |  31
# (2 rows)
#
# SELECT * FROM people ORDER BY name DESC LIMIT 3;
#  id |     name      |   job   | gender | age
# ----|---------------|---------|--------|--------
#   3 | Stephen King  | Writter | Male   |  54
#   4 | Mary Hoppkins | Singer  | Woman  |  19
#   2 | Emily Clark   | Actress | Woman  |  31
# (3 rows)
#
# SELECT * FROM people ORDER BY age DESC LIMIT 1;
#  id |     name     |   job   | gender | age
# ----|--------------|---------|--------|------
#   3 | Stephen King | Writter | Male   |  54
# (1 row)

# DELETE
#
# DELETE FROM people WHERE name = 'Mary';
# DELETE 0
# DELETE FROM people WHERE age > 100;
# DELETE 0
# DELETE FROM people WHERE gender = 'Male' AND age > 50;
# DELETE 1
# DELETE FROM people WHERE age > 100 LIMIT 10;
# DELETE 0

# UPDATE
# SELECT * FROM people WHERE name = 'Chris Scott';
# UPDATE people SET name = 'Christopher Scott' WHERE name = 'Chris Scott';
# UPDATE 1
# id |       name        |    job     | gender | age
# ----|------------------|------------|--------|------
#   2 | Emily Clark       | Actress    | Woman  |  31
#   4 | Mary Hoppkins     | Singer     | Woman  |  19
#   1 | Christopher Scott | Technician | Male   |  25
# (3 rows)
#
# UPDATE people SET name = 'Christopher Scott', age = 44 WHERE name = 'Chris Scott';
# UPDATE 0
# UPDATE people SET name = 'Christopher Nolan' WHERE name = 'Chris Scott' AND age = 25;
# UPDATE 0
# postgres=# UPDATE people SET name = 'Christopher Nolan';
# UPDATE 3
#  id |       name        |    job     | gender | age
# ----|-------------------|------------|--------|------
#   2 | Christopher Nolan | Actress    | Woman  |  31
#   4 | Christopher Nolan | Singer     | Woman  |  19
#   1 | Christopher Nolan | Technician | Male   |  25
# (3 rows)

# Using SQLite with Ruby

require 'sqlite3'

$db = SQLite3::Database.new('dbfile')
$db.results_as_hash = true

def disconnect_and_quit
  $db.close
  puts 'Bye!'
  exit
end
def create_table
  puts 'Creating people table'
  $db.execute %q{
  CREATE TABLE people (
  id integer primary key,
  name varchar(50),
  job varchar(50),
  gender varchar(6),
  age integer)
  }
end

def add_person
  puts 'Enter name:'
  name = gets.chomp
  puts 'Enter job:'
  job = gets.chomp
  puts 'Enter gender:'
  gender = gets.chomp
  puts 'Enter age'
  age = gets.chomp
  $db.execute('INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)', name, job, gender, age)
end

def find_person
  puts 'Enter name or ID of person to find:'
  id = gets.chomp

  person = $db.execute('SELECT * FROM people WHERE name = ? OR id = ?', id, id.to_i).first

  unless person
    puts 'No results found'
    return
  end

  puts %Q{Name: #{person['name']}
Job: #{person['job']}
Gender: #{person['gender']}
Age: #{person['age']}}
end

loop do
  puts %q{Please select an option:
     1. Create people table
     2. Add a person
     3. Look for a person
     4. Quit}

  case gets.chomp
  when '1'
    create_table
  when '2'
    add_person
  when '3'
    find_person
  when '4'
    disconnect_and_quit
  end
end

# Connecting to Other Database Systems

require 'sequel'
require 'pg'

DB = Sequel.connect('posgres://user:password@localhost/dbname')

DB.create_table :people do
  primary_key :id
  String :first_name
  String :last_name
  Integer :age
end

people = DB[:people]
people.insert( :first_name => 'Fred', :last_name => 'Bloggs', :age => 32 )

puts "'There are #{people.count} people in the database"

people.each do |person|
  puts person[:first_name]
end

DB.fetch('SELECT * FROM people') do |row|
  puts row[:first_name]
end

# ActiveRecord: A Sneak Peek

person = Person.where(name: 'Chris').first
person.age = 50
person.save

# This code can replace SQL such as this:
# SELECT * FROM people WHERE name = 'Chris';
# UPDATE people SET age = 50 WHERE name = 'Chris';

