class BankAccount
  attr_reader :customer_name
  attr_accessor :account_type

  def initialize(customer_name, account_type, account_number)
    @customer_name = upcase(customer_name)
    @account_type = account_type
    @account_number = account_number
  end

  def account_number
    @account_number.to_s.gsub(/.(?=.{3})/, "#")
  end

  # def partial_number
  #   encoded = @account_number.to_s.gsub(/.(?=.{3})/, "#")
  # end

  def customer_name=(name)
    @customer_name = upcase(name)
  end

  def upcase(name)
    name.upcase!
  end


private
  attr_writer :account_number

end #end

#p account = BankAccount.new('bob', 'Checking', 333666999)
#p account.account_number
