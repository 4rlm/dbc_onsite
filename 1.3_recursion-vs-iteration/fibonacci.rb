require 'benchmark'

###########################

def iterative_nth_fibonacci_number(n)
  sequence = [0, 1]

  until sequence[n]
    sequence << sequence.last(2).reduce(:+)
  end

  sequence[n]
end

# f = 30
# i = 500

# puts Benchmark.measure { iterative_nth_fibonacci_number(f) * i }

# 0)  0.000000   0.000000   0.000000 (  0.000003)
# 5)  0.000000   0.000000   0.000000 (  0.000009)
# 10) 0.000000   0.000000   0.000000 (  0.000010)
# 15) 0.000000   0.000000   0.000000 (  0.000011)
# 20) 0.000000   0.000000   0.000000 (  0.000014)
# 25) 0.000000   0.000000   0.000000 (  0.000037)
# 30) 0.000000   0.000000   0.000000 (  0.000039)

###########################

def recursive_nth_fibonacci_number(n)
  return 0 if n == 0
  return 1 if n <= 2

  recursive_nth_fibonacci_number(n - 1) + recursive_nth_fibonacci_number(n - 2)
end

f = 30
i = 500
puts Benchmark.measure { recursive_nth_fibonacci_number(f) * i }

# 0)  0.000000   0.000000   0.000000 (  0.000003)
# 5)  0.000000   0.000000   0.000000 (  0.000004)
# 10) 0.000000   0.000000   0.000000 (  0.000010)
# 15) 0.000000   0.000000   0.000000 (  0.000073)
# 20) 0.000000   0.000000   0.000000 (  0.000765)
# 25) 0.010000   0.000000   0.010000 (  0.008525)
# 30) 0.090000   0.000000   0.090000 (  0.094487)
