require_relative "spec_helper"

describe Invoice do
  let(:invoice) { Invoice.new(amount: 20.00, due_date: "10/12/2015", invoicee:  "Samantha Jackson") }

  it "has an amount due" do
    expect(invoice.amount).to eq 20.00
  end

  it "has a due date" do
    expect(invoice.due_date).to eq "10/12/2015"
  end

  it "has an someone responsible for payment" do
    expect(invoice.invoicee).to eq "Samantha Jackson"
  end

  describe "follow up person" do
    it "reports whether or not an employee has been assigned" do
      expect(invoice).to_not be_assigned
    end

    it "can have an assigned employee" do
      expect(invoice).to respond_to :assigned_employee=
    end

    it "has an assigned employee" do
      invoice.assigned_employee = "Jane"
      expect(invoice.assigned_employee).to eq "Jane"
    end
  end
end
