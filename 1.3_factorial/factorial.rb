# def factorial_iterative(n)
#   result = (1..num).inject {|sum, n| sum * n}
#   result
# end

def factorial_iterative(n)
  n = 1 if n == 0
  res = (1..n).inject {|sum, n| sum * n}
  res
end


def factorial_recursive(number)
  if number < 1
    1
  else
    number * factorial_recursive(number - 1)
  end
end

# p factorial_recursive(0)
