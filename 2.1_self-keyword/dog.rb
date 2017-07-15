class Dog
  attr_reader :name, :breed, :about

  def initialize(args)
    @name  = args[:name]
    @breed = args[:breed]
  end

  # Add a behavior to the Dog class object itself
  def self.create_multiple(data_for_multiple_dogs)
    data_for_multiple_dogs.map { |data_for_one_dog| Dog.new(data_for_one_dog) }
  end

  def about
    "#{@name} is a #{@breed}."
  end

end

# doggie_data = { name: 'Jayda', breed: 'English Bull Terrier' }
# adog = Dog.new(doggie_data)
# puts adog.about
