def shuffle(array)
  input = array.clone
  output = []
  len = input.length

  while len > 0
    r = Random.rand(0..len-1)
    output << input[r]
    input.delete_at(r)
    len = input.length
  end
  output
end

letters = [:a, :b, :c, :d, :e]
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

# puts shuffle(letters).inspect
# puts shuffle(numbers).inspect
# puts '>>>>>>>>>>>>>>>>>>>>>>>'
# puts letters.inspect
# puts numbers.inspect
