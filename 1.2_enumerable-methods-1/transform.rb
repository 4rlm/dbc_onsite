def exclamations(strings)
  loud_strings = []

  strings.map do |string|
    loud_strings << string.upcase + "!"
  end

  loud_strings
end

def square_all(numbers)
  squares = []

  numbers.map do |number|
    squares << number ** 2
  end

  squares
end

def first_letters(words)
  letters = []

  words.map do |word|
    letters << word[0]
  end

  letters
end
