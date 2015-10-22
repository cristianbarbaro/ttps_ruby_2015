require_relative 'countable.rb'

class Greeter
  include Countable

  def hi
    puts 'hola'
  end
  count_invocations_of :hi
end

a = Greeter.new

b = Greeter.new

puts a.invoked? :hi
# => false
puts b.invoked? :hi
# => false
a.hi
puts a.invoked? :hi
# => true
puts a.invoked :hi
# => 1
puts b.invoked :hi
# => 0
