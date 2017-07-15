# def most_frequent_words(filename, count = 5)
#   file_parser(filename)
# end

file_path = 'text-files/osiris_myth.txt'

def string_count_sorter(string_count_hash)
  rankings = string_count_hash.sort_by {|_key, value| value}
  puts rankings.inspect
end

def string_counter(array)
  string_count_hash = array.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h
  string_count_sorter(string_count_hash)
end

def document_formatter(doc)
  words = doc.split(/[^'\w]+/)
  string_counter(words)
end

def file_parser(filename)
  doc = ''
  File.open(filename, 'a+').each_line do |line|
    doc = doc+line
  end
  document_formatter(doc)
end

def most_frequent_words(filename)
  file_parser(filename)
end

most_frequent_words(file_path)
