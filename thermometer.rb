require_relative "convertible"

class Thermometer
  extend Convertible
end

puts Thermometer.c2f(100)
puts Thermometer.f2c(212)
