class Sock
  attr_reader :brand, :style, :color

  def initialize(args = {})
    @brand = args[:brand]
    @style = args[:style]
    @color = args[:color]
  end
end
