

def word_formatter(word)
  word_chars = word.downcase.chars.sort
  word_chars.join('')
end

def find_anagrams(possible_anagrams, word)
  input_word = word_formatter(word)
  detect = false

  possible_anagrams.map do |string|
    array_word = word_formatter(string)

    if input_word == array_word
      return "'#{word}' and '#{string}' are anagrams."
      detect = true
    end
  end

  if detect == false
    puts "'#{word}' is not an anagram of any words in '#{possible_anagrams}'."
  end

end


possible_anagrams = ['nighthawks', 'caret', 'react', 'trace', 'otters', 'melon']

word = 'lemon'

puts find_anagrams(possible_anagrams, word)
