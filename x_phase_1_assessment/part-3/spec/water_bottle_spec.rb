require_relative "spec_helper"

describe WaterBottle do
  let(:bottle) { WaterBottle.new(capacity: 1.5, material: "polycarbonate") }

  it "has a capacity" do
    expect(bottle.capacity).to eq 1.5
  end

  it "has a material" do
    expect(bottle.material).to eq "polycarbonate"
  end

  describe "reservations" do
    it "reports whether or not its reserved" do
      expect(bottle).to_not be_reserved
    end

    it "can be reserved" do
      bottle.reserve
      expect(bottle).to be_reserved
    end

    it "reports whether or not its available" do
      expect(bottle).to be_available
    end

    it "can become available" do
      bottle.reserve
      expect(bottle).to_not be_available

      bottle.end_reservation
      expect(bottle).to be_available
    end
  end

  describe "maintenance" do
    it "reports whether or not its damaged" do
      expect(bottle).to_not be_damaged
    end

    it "can be damaged" do
      bottle.record_damage
      expect(bottle).to be_damaged
    end

    it "can be repaired" do
      bottle.record_damage
      expect(bottle).to be_damaged

      bottle.repair
      expect(bottle).to_not be_damaged
    end
  end
end
