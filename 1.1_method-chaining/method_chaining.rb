# Refactor for elegance
def shout_backwards(string)
  all_caps  = string.upcase.reverse + "!!!"
end


# This is convoluted. Refactor for clarity.
def squared_primes(array)
  array.find_all{|x| (2..x-1).select(){|i| x % i == 0}.count == 0 && x > 1}.map{|p| p*p}


  # primes = []
  # array.each do |x|
  #   2.upto(x-1) do |i|
  #     if x % i == 0 && x > 2
  #       primes << x*x
  #     end
  #   end
  # end
  # primes

  # primes= []
  # array.find_all do |x|
  #   if x == 2
  #     primes << 2*2
  #   end

  #   if x > 2 && (x % 2 != 0)
  #   #(2..x-1).select()
  #    # if x % 2 != 0 && x > 1
  #   #{|i| x % i == 0}
  #     #x.count == 0 && x > 1
  #      primes << x * x
  #     #end
  #   end
  # end
  # # new_array.map{|p| p*p}
  # primes
end

puts squared_primes([2,3,4,5,6,7,8,9])
