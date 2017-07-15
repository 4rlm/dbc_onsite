def iterative_nth_fibonacci_number(n)
  return 0 if n < 1
  fib = (2..n).inject([0,1]) {|fib| fib << fib.last(2).inject(:+)}
  fib[-1]
end

def recursive_nth_fibonacci_number(n)
  return n if (0..1).include? n
  (recursive_nth_fibonacci_number(n - 1) + recursive_nth_fibonacci_number(n - 2))
end

