def combine_names(first_name, last_name)
  "#{first_name} #{last_name}"
end

names = %w[David Black]

puts combine_names(*names)
