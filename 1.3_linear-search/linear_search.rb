
def linear_search(target, arr)
  i = 0

  while i < arr.length
    if arr[i] == target
      return i
    else
      nil
    end
    i+=1
  end

end

b = [:Q, :O, :A, :A, :C, :G, :S, :U]
p linear_search(b, :A)

###############################################

def global_linear_search(target, arr)
  i = 0
  indices = []

  while i < arr.length
    if arr[i] == target
      indices << i
    else
      nil
    end
    i+=1
  end

  indices
end

letters = "bananas".chars
global_linear_search("a", letters)
