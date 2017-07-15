class Pear
  attr_reader :diameter

  def initialize
    @diameter = random_diameter
  end

  private
  def random_diameter
    [3.0, 3.1, 3.2, 3.3, 3.4].sample
  end
end