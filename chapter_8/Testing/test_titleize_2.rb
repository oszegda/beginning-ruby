# frozen_string_literal: true

# Unit Testing

# top-level documentation
class String
  def titleize
    self.gsub(/(\A|\s)\w/) {|letter| letter.upcase}
  end
end

require 'minitest/autorun'

# top-level documentation
class TestTitleize < Minitest::Test
  def test_basic
    assert_equal("Let's make a test fail", 'foo'.titleize)
  end
end

# run in terminal - ruby chapter_8/Testing/test_titleize_2.rb
