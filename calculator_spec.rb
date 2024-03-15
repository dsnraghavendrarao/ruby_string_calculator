require 'test/unit'
require_relative './calculator'

class TestStringCalculator < Test::Unit::TestCase
  def calculator_new
    StringCalculator.new
  end

  def test_success
    assert_equal(1, calculator_new.add("1")) 
    assert_equal(6, calculator_new.add("1,5"))
    assert_equal(6, calculator_new.add("1\n2,3"))
  end

  def test_success_delimiter
    assert_equal(3, calculator_new.add("//;\n1;2"))
  end

  def test_exception_handling_empty_string
    #should hanld exception when passed empty string as input
    ex = assert_raise ArgumentError do
      calculator_new.add("")
    end
    puts ex
  end

  def test_exception_handling_invalid_string
    ex = assert_raise StandardError do
      calculator_new.add("1,\n")
    end
    puts ex
  end

  def test_exception_handling_negative_integers
    ex = assert_raise ArgumentError do
      calculator_new.add("-1,2,\n")
    end
    puts ex
  end
end



# command to test -> ruby -I test test/test_my_class.rb