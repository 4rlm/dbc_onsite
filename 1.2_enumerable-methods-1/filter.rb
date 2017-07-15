def odd_integers(numbers)
  odds = []

  numbers.select do |number|
    odds << number if number.odd?
  end

  odds
end

def long_strings(strings, minimum_length)
  longs = []

  strings.select do |string|
    if string.length >= minimum_length
      longs << string
    end
  end

  longs
end

def multiples_of(possible_multiples, number)
  multiples = []

  possible_multiples.select do |possible_multiple|
    if possible_multiple % number == 0
      multiples << possible_multiple
    end
  end

  multiples
end
