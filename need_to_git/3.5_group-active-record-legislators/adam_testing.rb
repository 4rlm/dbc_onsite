# def digits(string_date)
#   digits = string_date.tr('^0-9', '').to_i
# end
#
# start_date = '1949-11-10'
# end_date = '1957-06-23'
#
# start_date = digits(start_date)
# end_date = digits(end_date)
#
#
# puts start_date
# puts end_date

# scope :bday_range, -> {bday_format.where("birthday = '1953-03-01'")}



def digits(string_date)
  digits = string_date.tr('^0-9', '').to_i
end

start_date = '1949-11-10'
end_date = '1957-06-23'

start_date = digits(start_date)
end_date = digits(end_date)


puts start_date
puts end_date
