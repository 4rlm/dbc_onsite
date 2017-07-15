def convert_to_roman(num)
  puts num
  return convert_to_arr(num)
end

def convert_to_arr(num)
  str = num.to_s
  arr = str.split('')
  segmenter(arr)
end

def segmenter(arr)
  # Segments the string number to item positions as integer.
  ones = arr[-1].to_i
  tens = arr[-2].to_i
  hundreds = arr[-3].to_i
  thousands = arr[-4].to_i
  old_rom = "#{thousands(thousands)}#{hundreds(hundreds)}#{tens(tens)}#{ones(ones)}"


  rom_ones = ones(ones)
  rom_tens = tens(tens)
  rom_hundreds = hundreds(hundreds)
  rom_thousands = thousands(thousands)

  new_rom = new_romanizer(rom_ones, rom_tens, rom_hundreds, rom_thousands)

  puts "Enter 'old' for old version and 'new' for new version:"
  version = gets.chomp

  if version == "old"
    p old_rom
  elsif version == "new"
    p new_rom
  end

end


#########

def new_romanizer(rom_ones, rom_tens, rom_hundreds, rom_thousands)
  new_rom = "#{rom_thousands}#{new_hundreds(rom_hundreds)}#{new_tens(rom_tens)}#{new_ones(rom_ones)}"
  new_rom
end

def new_ones(old_rom)
  if old_rom
    if old_rom.include?("VIIII")
      new_rom = old_rom.gsub(/VIIII/, "IX")
      p new_rom
    elsif old_rom.include?("IIII")
      new_rom = old_rom.gsub(/IIII/, "IV")
      p new_rom
    else
      old_rom
    end
  end
end

def new_tens(old_rom)
  if old_rom
    if old_rom.include?("LXXXX")
      new_rom = old_rom.gsub(/LXXXX/, "XC")
      p new_rom
    elsif old_rom.include?("XXXX")
      new_rom = old_rom.gsub(/XXXX/, "XL")
      p new_rom
    else
      old_rom
    end
  end
end

def new_hundreds(old_rom)
  if old_rom
    if old_rom.include?("DCCCC")
      new_rom = old_rom.gsub(/DCCCC/, "CM")
      new_rom
    elsif old_rom.include?("CCCC")
      new_rom = old_rom.gsub(/CCCC/, "CD")
      new_rom
    else
      old_rom
    end
  end
end


#########

def ones(num)
  if num > 0 && num < 5
    old_num = "I" * num
    old_num
    # if num == 4
    #   new_num = "IV"
    # end
  elsif num > 5 && num < 10
    remainder = num - 5
    old_num = "V" + ("I" * remainder)
    old_num
  elsif num == 5
    old_num = "V"
    old_num
  end
end

def tens(num)
  if num > 0 && num < 5
    old_num = "X" * num
    old_num
  elsif num > 5 && num < 10
    remainder = num - 5
    old_num = "L" + ("X" * remainder)
    old_num
  elsif num == 5
    old_num = "L"
    old_num
  end
end

def hundreds(num)
  if num > 0 && num < 5
    old_num = "C" * num
    old_num
  elsif num > 5 && num < 10
    remainder = num - 5
    old_num = "D" + ("C" * remainder)
    old_num
  elsif num == 5
    old_num = "D"
    old_num
  end
end

def thousands(num)
  if num <= 9
    old_num = "M" * num
    old_num
  end
end


convert_to_roman(432)
