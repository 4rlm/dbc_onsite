# Look at the tests in `spec/social_security_numbers_spec.rb`
# to see a description of how these methods should behave.

# Determine whether a string contains a Social Security Number.
def has_ssn?(string)
  arr = string.scan(/\d{3}-\d{2}-\d{4}/)
  if arr == nil || arr == []
    false
  else
    string.include?(arr[0])
  end
end

# Find and return a Social Security Number.
def grab_ssn(string)
  arr = string.scan(/\d{3}-\d{2}-\d{4}/)
  if arr == nil || arr == []
    ""
  else
    arr[0]
  end
end

# Find and return all Social Security Numbers.
def grab_all_ssns(string)
  arr = string.scan(/\d{3}-\d{2}-\d{4}/)
  if arr == nil || arr == []
    ""
  else
    arr
  end
end

# Obfuscate all Social Security Numbers. Example: XXX-XX-4430.
def hide_all_ssns(string)
  arr = string.scan(/\d{3}-\d{2}-\d{4}/)
  if arr == nil || arr == []
    string
  else
    arr.map!{|ss| "XXX-XX-#{ss[-4..-1]}"}

    new_string = "The numbers are #{arr[0..-2].join(', ')}, and #{arr[-1]}"
    new_string
  end
end

# Format all Social Security Numbers to use single dashes for delimiters:
# '480014430', '480.01.4430', and '480--01--4430' would all be formatted '480-01-4430'.
def format_ssns(string)
  arr = string.split(",")
  arr.map!{|ss| ss.gsub(/[^0-9]/, "")}

  arr.map! do |ss|
  #   if ss.length == 9
  #     ss = "#{ss[0..2]}-#{ss[3..4]}-#{ss[5..8]}"
  #
  #     new_string = "The numbers are #{arr[0..-2].join(', ')}, and #{arr[-1]}"
  #     new_string
  #
  # end
  #
  #
  #
  # if arr == nil || arr == []
  #   string
  # else
  # arr.map! do |ss|
  #   if ss.length != 9
  #     arr.delete(ss)
  #   end
  # end
  #
  # if arr == nil || arr == []
  #   string
  # else
  #   arr.map!{|ss| "#{ss[0..2]}-#{ss[3..4]}-#{ss[5..8]}"}
  #   new_string = "The numbers are #{arr[0..-2].join(', ')}, and #{arr[-1]}"
  #   new_string
  # end
end
