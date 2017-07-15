require_relative "../company"

describe Company do
  let(:company) { Company.new("Acme") }

  it "has a readable company name" do
    expect(company.company_name).to eq("Acme")
  end

  it "has a writable name" do
    expect { company.company_name = "Austin Coders Inc" }.to change { company.company_name }.to "Austin Coders Inc"
  end

  it "has a readable employees" do
    expect(company.employees).to eq []
  end

  it "has a readable add_employee" do
    expect(company.add_employee("Catherine")).to eq(["Catherine"])
  end

end
