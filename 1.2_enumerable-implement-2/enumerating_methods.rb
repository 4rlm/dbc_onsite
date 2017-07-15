require 'pry'
#each is already implemented as an example, check the test for it too!
#strings = ['a', 'ab', 'abc']
#numbers = [1, 2, 3]

def each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

def find(array)
  i = 0
  while i < array.length
    return array[i] if yield(array[i])
    i += 1

  end
end
#find(numbers) { |number| number > 1 }
#this is an example of what could be called for this to run outside of the testing environment

def map(array)
  i = 0
  array2 = []
  while i < array.length
     array2 << yield(array[i])
    i += 1
  end
  return array2
end
#map(strings) { |string| string.upcase }
#this is an example of what could be called for this to run outside of the testing environment
def reject(array)
  i = 0
  array2 = []

  while i < array.length
    if yield(array[i])
      array2 << array[i]
    end
    i += 1
  end
  return array - array2
end

def select(array)
  i = 0
  array2 = []
  while i < array.length
    if yield(array[i])
      array2 << array[i]
    end
    i += 1
  end
  return array2
end
#select(numbers) { |number| number > 2 }
#this is an example of what could be called for this to run outside of the testing environment

# Coding all? is optional.
def all?(array)
end

# Coding reduce is optional.
def reduce(array, starting_value = nil)
end

#find(numbers) { |n| n > 1 }
#find(strings)
#puts find(numbers)
