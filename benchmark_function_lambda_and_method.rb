require 'benchmark'

def mult_function(a, b)
  a * b
end

mult_lambda = ->(a, b) { a * b }

class Calc
  def mult_method(a, b)
    a * b
  end
end

N = 50_000_000

puts 'function'
puts(Benchmark.measure {
  N.times do
    mult_function rand, rand
  end
})

puts 'lambda'
puts(Benchmark.measure {
  N.times do
    mult_lambda.call rand, rand
  end
})

puts 'object method'
calc = Calc.new
puts(Benchmark.measure {
  N.times do
    calc.mult_method rand, rand
  end
})
