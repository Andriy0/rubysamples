def trial
  arr = []

  50.times do
    arr << rand(0..1)
  end

  reshka_count = arr.select { |x| x == 1 }.count
  eagle_count = 50 - reshka_count

  { eagle_count: eagle_count, reshka_count: reshka_count }
end

n = 100_000_0
success_trials = 0

n.times do
  success_trials += 1.0 if trial[:eagle_count] == 10
end

puts "N of trials: #{n}"
puts "N of success trials: #{success_trials}"
puts format('Probability of 10 eagles from 50 tries: %0.7f', success_trials / n)
