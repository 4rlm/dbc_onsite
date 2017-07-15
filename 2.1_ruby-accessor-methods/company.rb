class Company
  attr_accessor :company_name
  attr_reader :employees

  def initialize(name, employees = [])
    @company_name = name
    @employees    = employees
  end

  # def company_name
  #   @company_name
  # end
  #
  # def company_name=(new_name)
  #   @company_name = new_name
  # end

  def add_employee(employee)
    @employees << employee
  end

  # def employees
  #   @employees
  # end
end

acme = Company.new("Acme")
p acme.company_name
p acme.company_name = "Austin Coders Inc"
p acme.add_employee("Tom Smith")
p acme.employees
p acme.add_employee("Barb Jones")
p acme.employees

# p acme
