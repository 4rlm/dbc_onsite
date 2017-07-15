
def anagram_canonical_form(w)
  r = w.downcase.chars.sort!
  r
end

def anagrams?(word1, word2)
  p w1 = anagram_canonical_form(word1)
  p w2 = anagram_canonical_form(word2)

  if w1 == w2
    "Yes, it is."
  else
    "No.  It's not."
  end
end

puts anagrams?('Melon', 'LeMoN')
