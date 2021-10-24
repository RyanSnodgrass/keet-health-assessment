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
    assert_equal expectation, result
  end

  # I've got a neat idea. turn the time into total minutes. will need to be tested
  # later that it can handle second 12 hour PM
  def test_parses_total_minutes
    # 9 * 60 = 540
    # 540 + 13 = 553
    expectation = 553
    result = @t.minutes_since_midnight('9:13')
    assert_equal expectation, result
  end

  # It seems silly to test such a simple thing. But I want to keep the #add_minutes
  # method to still return a string. This also makes testing much easier.
  def test_that_a_computer_can_add_numbers
    expectation = 3
    result = @t.compute_addition(1, 2)
    assert_equal expectation, result
  end

  # this will also need to be refactored later to handle second 12 hour PM
  def test_converts_total_minutes_back_to_standard_time
    expectation = '9:13'
    result = @t.convert_to_human_time(553)
    assert_equal expectation, result
  end

  # save for later. no time.
  # def test_handle_12_hour_time_window_for_total_minutes
  #   # 12 * 60 = 720
  #   # 3 * 60 = 180
  #   # 720 + 180 + 45 = 945
  #   expectation = 945
  #   result = @t.minutes_since_midnight('9:13', )
  # end
end
