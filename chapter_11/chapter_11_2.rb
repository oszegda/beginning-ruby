# frozen_string_literal: true

# Threads
# Basic Ruby Threads in Action

threads = []

10.times do
  thread = Thread.new do
    10.times { |i| print i; $stdout.flush; sleep rand(2)}
  end

  threads << thread
end

threads.each { |thread| thread.join }

# Advanced Thread Operations
# Waiting for Threads to Finish Redux

threads = []

10.times do
  thread = Thread.new do
    10.times { |i| print i; $stdout.flush; sleep rand(2)}
  end

  threads << thread
end

threads.each do |thread|
  puts " Thread #{thread.object_id} didn't finish in 1s" unless thread.join(1)
end

# Getting a List of All Threads

10.times { Thread.new { 10.times { |i| print i; $stdout.flush; sleep rand(2) } } }
Thread.list.each { |thread| thread.join unless thread == Thread.main }

# Thread Operations from Within Threads Themselves

Thread.new do
  10.times do |i|
    print i
    $stdout.flush
    Thread.stop
  end
end

Thread.list.each { |thread| thread.run }

2.times { Thread.new { 10.times{ |i| print i; $stdout.flush; Thread.pass } } }
Thread.list.each { |thread| thread.join unless thread == Thread.main }
