require_relative "spec_helper"

describe Tent do
  let(:tent) { Tent.new(capacity: 4) }

  it "has a capacity" do
    expect(tent.capacity).to eq 4
  end

  describe "reservations" do
    it "reports whether or not its reserved" do
      expect(tent).to_not be_reserved
    end

    it "can be reserved" do
      tent.reserve
      expect(tent).to be_reserved
    end

    it "reports whether or not its available" do
      expect(tent).to be_available
    end

    it "can become available" do
      tent.reserve
      expect(tent).to_not be_available

      tent.end_reservation
      expect(tent).to be_available
    end
  end

  describe "maintenance" do
    it "reports whether or not its damaged" do
      expect(tent).to_not be_damaged
    end

    it "can be damaged" do
      tent.record_damage
      expect(tent).to be_damaged
    end

    it "can be repaired" do
      tent.record_damage
      expect(tent).to be_damaged

      tent.repair
      expect(tent).to_not be_damaged
    end
  end
end
