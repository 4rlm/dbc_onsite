require_relative "spec_helper"

describe Campsite do
  let (:campsite) { Campsite.new(location: "2A", square_footage: 2400, power: false, water: true) }

  it "has a location" do
    expect(campsite.location).to eq "2A"
  end

  it "has a size in square feet" do
    expect(campsite.square_footage).to eq 2400
  end

  it "can be powered" do
    expect(campsite.powered?).to eq false
  end

  it "can have water onsite" do
    expect(campsite.water?).to eq true
  end

  describe "reservations" do
    it "reports whether or not its reserved" do
      expect(campsite).to_not be_reserved
    end

    it "can be reserved" do
      campsite.reserve
      expect(campsite).to be_reserved
    end

    it "reports whether or not its available" do
      expect(campsite).to be_available
    end

    it "can become available" do
      campsite.reserve
      expect(campsite).to_not be_available

      campsite.end_reservation
      expect(campsite).to be_available
    end
  end

  describe "caretaker" do
    it "reports whether or not an employee has been assigned" do
      expect(campsite).to_not be_assigned
    end

    it "can have an assigned employee" do
      expect(campsite).to respond_to :assigned_employee=
    end

    it "has an assigned employee" do
      campsite.assigned_employee = "Jane"
      expect(campsite.assigned_employee).to eq "Jane"
    end
  end
end
