def fac(n) # => Calculates factorial of number.
  if n < 1
    1
  else
    n * fac(n - 1)
  end
end

def find_subsets(n, r)
  fn = fac(n)
  fr = fac(r)
  ncr = fn / ( fr * fac((n - r)) )
end

######### Runner ########
n = 0
r = 5
puts find_subsets(n, r).inspect
######### Expectations ########
# subset_count(0, 5)  # => 0
# subset_count(6, 2)  # => 15
# subset_count(6, 3)  # => 20
# subset_count(24, 4)  # => 10626
