
# def core(args)
#   name = args[:name]
#   city = args[:city]
# end
#
# core({name: "adam"})
# core({city: "austin"})
#############################

### Use Fetch ###
# color = options.fetch(:color) { raise "You must supply a :color option!" }
#
# verbose = options.fetch('verbose'){ false }

#############################


letters = %w(a b c d e)
first = letters.fetch(0) { false }
sixth = letters.fetch(5, 'surprise')
seventh = letters.fetch(6) { false }
eighth = letters.fetch(7) { raise "You must supply a valid index #" }

puts first.inspect
puts sixth.inspect
puts seventh.inspect
puts eighth.inspect



#############################
# a = [ 11, 22, 33, 44 ]
# puts first = a.fetch(1)               #=> 22
# puts a.fetch(-1)              #=> 44
# puts a.fetch(4, 'cat')        #=> "cat"
# puts a.fetch(4) { |i| i*i }   #=> 16
