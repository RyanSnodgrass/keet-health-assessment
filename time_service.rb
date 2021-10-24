require 'byebug'

module TimeService
  class FirstClass
    class SecondClass
      attr_accessor :bar, :baz

      def initialize
        yield self
      end
    end
  end
end

t = TimeService::FirstClass::SecondClass.new do |f|
  f.bar = 123
  f.baz = 456
end

puts t.bar
