# frozen_string_literal: true

# Benchmarking and Profiling
# Simple Benchmarking

require 'benchmark'
puts Benchmark.measure { 10_000.times { print '.' } }

iterations = 1_000_000
b = Benchmark.measure do
  for i in 1..iterations
    x = i
  end
end

c = Benchmark.measure do
  iterations.times do |i|
    x = i
  end
end

puts b
puts c

Benchmark.bm do |bm|
  bm.report('for:') do
    for i in 1..iterations
      x = i
    end
  end
  bm.report('times:') do
    iterations.times do |i|
      x = i
    end
  end
end
