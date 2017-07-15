require_relative "spec_helper"

describe Sock do
  let(:sock) { Sock.new(brand: "Gold Toe", style: "mid-calf", color: "black") }

  it "has a brand" do
    expect(sock.brand).to eq "Gold Toe"
  end

  it "has a style" do
    expect(sock.style).to eq "mid-calf"
  end

  it "has a color" do
    expect(sock.color).to eq "black"
  end
end
