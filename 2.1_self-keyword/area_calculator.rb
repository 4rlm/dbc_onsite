module AreaCalculator
  # Add behaviors to the module here
  # within the module definition

  def self.area_of_rectangle(width, length)
    width * length
  end

  def self.area_of_square(side)
    side ** 2
  end

  def self.area_of_triangle(base, height)
    (base * height) / 2
  end

end

# calc = AreaCalculator
# puts calc.area_of_rectangle(2, 3)
# puts calc.area_of_square(5)
# puts calc.area_of_triangle(3, 4)
