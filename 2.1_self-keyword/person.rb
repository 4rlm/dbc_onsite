class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  # def full_name
  #   "#{self.first_name} #{self.last_name}"
  # end

  def full_name
    "#{first_name} #{last_name}"
  end

  def return_self
    return self
  end

end

# tom = Person.new('tom', 'smith')
# puts tom.full_name
