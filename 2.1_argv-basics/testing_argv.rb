# if ARGV.any?
# 6	  # Parse the command line arguments
# 7	  command = ARGV.first
# 8	  options = ARGV[1..-1]

# input_array = ARGV
#
# puts "First.."
# input_array[0] = gets.chomp
#
# puts input_array.length
# puts input_array.to_s

# first_arg, *the_rest = ARGV
# puts first_arg
# puts the_rest

puts "Enter string..."

if ARGV.any?
  # Parse the command line arguments
  command = ARGV.first
  puts command
  # options = ARGV[1..-1]
end
