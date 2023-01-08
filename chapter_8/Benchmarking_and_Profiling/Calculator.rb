# frozen_string_literal: true

# Profiling

require 'ruby-prof'

# top-level documentation
class Calculator
  def self.count_to_large_number
    x = 0
    10_000.times { x += 1 }
  end

  def self.count_to_small_number
    x = 0
    1000.times { x += 1 }
  end
end
Calculator.count_to_large_number
Calculator.count_to_small_number