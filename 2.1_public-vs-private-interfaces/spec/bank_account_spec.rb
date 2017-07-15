require_relative '../bank_account'

describe BankAccount do
  let(:account) { BankAccount.new("bob", "Checking", 333666999) }

  it "has a readable account_number" do
    expect(account.account_number).to eq("######999")
  end

  it "has a readable customer_name" do
    expect(account.customer_name).to eq("BOB")
  end

  it "has a writable customer_name" do
    expect{ account.customer_name = "Sara" }.to change { account.customer_name }.to "SARA"
  end

  it "has a readable account type" do
    expect(account.account_type).to eq "Checking"
  end

  it "has a writable account type" do
    expect { account.account_type = "Savings" }.to change { account.account_type }.to "Savings"
  end

  # it "has a private account_number" do #this will fail
  #   expect {account.account_number = 333666000 }.to change {account.account_number}.to "######000"
  # end

  it "it has a private account_number that can not be re - written" do
    expect { account.account_number = 333666000 }.to raise_error(NoMethodError)
  end



end


# NoMethodError
