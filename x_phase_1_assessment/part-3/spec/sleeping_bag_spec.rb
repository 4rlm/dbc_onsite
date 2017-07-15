require_relative "spec_helper"

describe SleepingBag do
  let(:bag) { SleepingBag.new(style: "mummy", size: "adult", shell: "nylon") }

  it "has a style" do
    expect(bag.style).to eq "mummy"
  end

  it "has a size" do
    expect(bag.size).to eq "adult"
  end

  it "has a shell" do
    expect(bag.shell).to eq "nylon"
  end

  describe "reservations" do
    it "reports whether or not its reserved" do
      expect(bag).to_not be_reserved
    end

    it "can be reserved" do
      bag.reserve
      expect(bag).to be_reserved
    end

    it "reports whether or not its available" do
      expect(bag).to be_available
    end

    it "can become available" do
      bag.reserve
      expect(bag).to_not be_available

      bag.end_reservation
      expect(bag).to be_available
    end
  end

  describe "maintenance" do
    it "reports whether or not its damaged" do
      expect(bag).to_not be_damaged
    end

    it "can be damaged" do
      bag.record_damage
      expect(bag).to be_damaged
    end

    it "can be repaired" do
      bag.record_damage
      expect(bag).to be_damaged

      bag.repair
      expect(bag).to_not be_damaged
    end
  end

end
