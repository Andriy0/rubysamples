N = 3
U = 1
M = N + U
LAM = 5
MU = 2

# N = 2
# U = 3
# M = N + U
# LAM = 5
# MU = 4

RO = LAM / MU.to_f

def fact(n)
  (1..n).reduce(1, :*)
end

def expr1(k)
  fact(M).to_f / (fact(k) * fact(M - k)) * RO**k
end

def expr2(k)
  fact(M).to_f / (N**(k - N) * fact(N) * fact(M - k)) * RO**k
end

def expr3(k)
  ((k - N) * fact(M)).to_f / (N**(k - N) * fact(N) * fact(M - k)) * RO**k
end

def expr4(k)
  fact(M).to_f / (fact(k - 1) * fact(M - k)) * RO**k
end

def p0
  1.to_f /
    ((0..N).map { |k| expr1(k) }.sum +
    ((N + 1)..M).map { |k| expr2(k) }.sum)
end

def pn
  (1..N).map do |k|
    expr1(k) * p0
  end
end

def pk
  ((N + 1)..M).map do |k|
    expr2(k) * p0
  end
end

def lq
  ((N + 1)..M).map do |k|
    expr3(k) * p0
  end.sum
end

Q = 1 - pk.last

K_BUSY = RO * Q

K_FREE = N - K_BUSY

K_LOAD = K_BUSY / U

K_IDLE = p0 / N

puts "P0 = #{p0}"

(pn + pk).each_with_index do |pn, i|
  puts "P#{i + 1} = #{pn}"
end

print (0..M).map { |i| "P#{i}" }.to_a.join(' + ')

puts " = #{(pk + pn + [p0]).sum}"

puts "Q = #{Q}"

puts "K_busy = #{K_BUSY}"

puts "K_free = #{K_FREE}"

puts "K_load = #{K_LOAD}"

puts "K_idle = #{K_IDLE}"

puts "Lq = #{lq}"
