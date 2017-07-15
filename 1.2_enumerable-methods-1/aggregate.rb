# require 'pry'
######## Original: ###########
#def sum(numbers, starting_value = 0)
#  total = starting_value

  # numbers.each do |number|
  #   total += number
  # end
  ######## Modifications: ###########

  def sum(numbers, starting_value = 0)
    numbers.reduce(starting_value) do |sum, number|
      total = sum + number
    end
  end

  ######## Original: ###########
# def hyphenate(words)
#   hyphenated_words = ""
#
#   words.each do |word|
#     if hyphenated_words.empty?
#       hyphenated_words += word
#     else
#       hyphenated_words += "-#{word}"
#     end
#   end
#
#   hyphenated_words
# end

######## Modifications: ###########
#words = ["what", "have", "you"]

def hyphenate(words)
  hyphenated_words = ""
  words.reduce(hyphenated_words) do |result, word|

     if result.empty?
       result += word
     else
       result += "-#{word}"
     end
       result
   end

end

#hyphenate(words)
