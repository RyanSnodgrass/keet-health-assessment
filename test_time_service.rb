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
end
