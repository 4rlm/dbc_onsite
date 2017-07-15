# module Sample
#
# end

# class Animals
#   def initialize(args = {})
#   end
#
#   def about
#   end
#
# end

# class Plants
#   def initialize(args = {})
#     @array = []
#   end
#
#   def about(type)
#     @array << type
#   end
#
#   @array
#
# end
#
# mint = Plants.new
# p mint.about("mint")
# p mint
#

require 'csv'

# array = []
#
# def doc(filename, array)
#   CSV.open("./sample.csv", 'wb') do |row|
#     array << row
#   end
#   array
# end
#
# filename = 'sample.csv'
# doc(filename, array)
#
# p array

array = [(1..26).to_a, ('a'..'z').to_a]

CSV.open("./file.csv", "wb") do |csv|
  array.each do |arr|
    csv << arr
  end
end

arr_of_arrs = CSV.parse("file.csv", 'a+') do |row|
  p row
end

p arr_of_arrs

# csv_string = ["CSV", "data"].to_csv
