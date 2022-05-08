def trial
  arr = []

  50.times do
    arr << rand(0..1)
  end

  reshka_count = arr.select { |x| x == 1 }.count
  eagle_count = 50 - reshka_count

  { eagle_count: eagle_count, reshka_count: reshka_count }
end

main = Ractor.new name: 'main' do
  loop do
    Ractor.yield Ractor.receive
  end
end

n = [400_000, 400_000, 400_000, 400_000]

secondary_racts = n.map do |n|
  Ractor.new main, n do |main_ract, n|
    successful_trials = 0

    n.times do
      successful_trials += 1 if trial[:eagle_count] == 10
    end

    main_ract.send successful_trials
  end
end

successful_trials = []

4.times do
  successful_trials << main.take
end

puts "N of trials: #{n.sum}"
puts "N of success trials: #{successful_trials.sum}"
puts format('Probability of 10 eagles from 50 tries: %0.7f', successful_trials.sum.to_f / n.sum)
