require 'minitest/autorun'

load 'time_service.rb'

class TestTimeService < Minitest::Test
  def setup
    @t = TimeService::FirstClass::SecondClass.new do |f|
      f.bar = 123
      f.baz = 456
    end
  end
  def test_the_class_is_initialized_with_a_block
    assert_equal @t.bar, 123
    assert_equal @t.baz, 456
  end

  # According to the requirements, the input will be a string like "9:13 AM".
  # Probably the first thing I'll do is knock off the AM/PM from the input
  def test_knocks_off_ampm
    expectation = '9:13'
    result = @t.knock_off_ampm('9:13 AM')
    assert_equal expectation, result
  end

  # test that it can handle "Am/PM" and "am/pm"
  def test_case_insensitive_knockoff
    expectation = '9:13'
    result = @t.knock_off_ampm('9:13 pm')
    assert_equal expectation,result
  end
end
