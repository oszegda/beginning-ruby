# frozen_string_literal: true

# Basic inclusion

# top-level documentation
class String
  def vowels
    self.scan(/[aeiou]/i)
  end
end