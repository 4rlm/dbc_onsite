# Rewrite this method with your own sorting algorithm
# Make your algorithm pass each of the tests in spec/sort_spec.rb
# def sort(objects)
#   objects.sort
# end

def sort(objects)
  objects.sort_by {|x| x.to_s }
end
