require 'byebug'

module TimeService
  class FirstClass
    class SecondClass
      attr_accessor :bar, :baz

      def initialize
        yield self
      end

      def add_minutes(time_string, minutes)
        sub_time = knock_off_ampm(time_string)
        current_time_in_minutes = minutes_since_midnight(sub_time)
        new_minutes = compute_addition(current_time_in_minutes, minutes)
        human_time = convert_to_human_time(new_minutes)
        "#{human_time} AM"
      end

      def convert_to_human_time(minutes)
        hours, minutes = minutes.divmod(60)
        "#{hours}:#{minutes}"
      end

      def compute_addition(first, second)
        first + second
      end

      def knock_off_ampm(time_string)
        time_string.gsub(/ [apAP][mM]$/, '')
      end

      def minutes_since_midnight(sub_time)
        total_minutes = 0
        time_array = sub_time.split(':')
        hours = time_array[0].to_i
        minutes = time_array[1].to_i
        total_minutes += (hours * 60)
        total_minutes += minutes
      end
    end
  end
end

t = TimeService::FirstClass::SecondClass.new do |f|
  f.bar = 123
  f.baz = 456
end

puts t.bar
