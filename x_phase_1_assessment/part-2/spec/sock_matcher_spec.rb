require_relative "spec_helper"

describe SockMatcher do
  let(:sock)             { Sock.new(brand: "Gold Toe", style: "mid-calf", color: "black") }
  let(:matching_sock)    { Sock.new(brand: "Gold Toe", style: "mid-calf", color: "black") }
  let(:other_color_sock) { Sock.new(brand: "Gold Toe", style: "mid-calf", color: "white") }
  let(:other_style_sock) { Sock.new(brand: "Gold Toe", style: "ankle", color: "black") }
  let(:other_brand_sock) { Sock.new(brand: "Hanes", style: "mid-calf", color: "black") }

  let(:shirt) { double("Shirt", class: "shirt", brand: "Gold Toe", style: "mid-calf", color: "black") }

  let(:matcher) { SockMatcher.new }

  it "matches socks with the same brand, color, and style" do
    expect(matcher.match?(sock, matching_sock)).to be true
  end

  it "doesn't match socks with different brands" do
    expect(matcher.match?(sock, other_brand_sock)).to be false
  end

  it "doesn't match socks with different styles" do
    expect(matcher.match?(sock, other_style_sock)).to be false
  end

  it "doesn't match socks with different colors" do
    expect(matcher.match?(sock, other_color_sock)).to be false
  end

  it "doesn't match a sock with itself" do
    expect(matcher.match?(sock, sock)).to be false
  end

  it "only matches socks" do
    expect(matcher.match?(sock, shirt)).to be false
  end
end
