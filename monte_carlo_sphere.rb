count = 0
r = 5.0
n = 10_000

def in_sphere?(points, radius)
  case points
  in [x1, x2, x3]
    x1 * x1 + x2 * x2 + x3 * x3 <= radius**2
  else
    raise ArgumentError
  end
end

n.times do
  x1, x2, x3 = rand(0..r), rand(0..r), rand(0..r)
  count += 1 if in_sphere?([x1, x2, x3], r)
end

vol_m = 4/3.0 * 6*count/n.to_f * r**3
vol = 4/3.0 * Math::PI * r**3

puts "N of tries: #{n}"
puts "N of successful tries: #{count}"
puts "Radius of sphere: #{r}"
puts "Volume of sphere using Monte Carlo method: #{vol_m}"
puts "Volume of sphere using standard formula: #{vol}"
