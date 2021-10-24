require 'byebug'

module TimeService
  class FirstClass
    class SecondClass
      attr_accessor :bar, :baz

      def initialize
        yield self
      end

      def add_minutes(time_string, minutes)
        time_string = knock_off_ampm(time_string)
      end

      def knock_off_ampm(time_string)
        time_string.gsub(/ [apAP][mM]$/, '')
      end
    end
  end
end

t = TimeService::FirstClass::SecondClass.new do |f|
  f.bar = 123
  f.baz = 456
end

puts t.bar
