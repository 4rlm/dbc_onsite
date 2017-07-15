def word_converter(string)
  range_end = string.index(/[aeiouy]/)
  leading_consonants = string[0...range_end]
  remainder = string[range_end..-1]
  final_string = "#{remainder}#{leading_consonants}ay"
  final_string
end

def word_qualifier(string)
  if string[0].match(/[aeiouy]/)
    p string
  else
    word_converter(string)
  end
end

def string_parser(string)
  array = string.split(/\W+/)
  array_processor(array)
end

def array_processor(array)
  result = array.map! do |string|
    word_qualifier(string)
  end
  final_string = result.join(' ')
end

string = 'rabbits love tricks'
puts string_parser(string)
