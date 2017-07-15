class Person

  attr_accessor :name, :hobby

  def initialize(args)
    @age = args[:age]
    @alive = args.fetch(:alive, true)
    @name = args.fetch(:name, "Adam")
    @hobby = args.fetch(:hobby, "sports")
  end

  def birthday
    # age = 1
    self.age = age + 1
  end

  def die
    self.alive = false
  end

  private
  attr_accessor :age
  attr_writer :alive

end


torey = Person.new({age: 34})
torey.name = "Bill"

p torey.name
p torey.birthday
p torey.die
p torey.hobby = "travel"
# p torey.birthday.name

def changer(name, age)
  # p torey.name
  # p torey.birthday
  # p torey.die
  # p torey.hobby = "travel"
  puts "#{torey.name} is #{torey.birthday} years old."
end
