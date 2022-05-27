class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end

    self
  end

  def my_map
    acc = []

    my_each { |e| acc << (yield e) }

    acc
  end
end

class Integer
  def my_times(&block)
    (0...self).to_a.my_each(&block)
  end
end

[1, 4, 6, 2, 3].my_each { |n| puts n }

names = %w[David Alan Black]

p (names.my_map { |name| name.upcase })

5.my_times { |n| puts n }
