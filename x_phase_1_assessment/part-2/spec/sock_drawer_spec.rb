require_relative "spec_helper"

describe SockDrawer do
  let(:socks) { [first_black_sock, first_white_sock, sporty_red_nike, first_red_sock, second_white_sock, dressy_red_sock, third_white_sock] }
  let(:first_white_sock)  { Sock.new(brand: "Nike", style: "quarter", color: "white") }
  let(:second_white_sock) { Sock.new(brand: "Nike", style: "quarter", color: "white") }
  let(:third_white_sock)  { Sock.new(brand: "Nike", style: "quarter", color: "white") }
  let(:dressy_red_sock)   { Sock.new(brand: "Xiaomi", style: "sporty", color: "red") }
  let(:first_red_sock)    { Sock.new(brand: "Nike", style: "quarter", color: "red") }
  let(:first_black_sock)  { Sock.new(brand: "Nike", style: "quarter", color: "black") }
  let(:sporty_red_nike)   { Sock.new(brand: "Nike", style: "sporty", color: "red") }

  let(:matcher) { SockMatcher.new }

  let(:drawer) { SockDrawer.new(socks: socks, matcher: matcher) }


  it "has socks" do
    expect(drawer.socks).to match_array socks
  end

  it "has a matcher" do
    expect(drawer.matcher).to eq matcher
  end

  describe "#supply_match_for", { supply_match_for: true } do
    let(:second_red_sock) { Sock.new(brand: "Nike", style: "quarter", color: "red") }

    context "when it has a matching sock" do
      it "returns a matching sock" do
        expect(drawer.supply_match_for(second_red_sock)).to eq first_red_sock
      end

      context "the matching sock" do
        it "matches in brand" do
          expect(drawer.supply_match_for(second_red_sock).brand).to eq first_red_sock.brand
        end

        it "matches in color" do
          expect(drawer.supply_match_for(second_red_sock).color).to eq first_red_sock.color
        end

        it "matches in style" do
          expect(drawer.supply_match_for(second_red_sock).style).to eq first_red_sock.style
        end
      end

      it "removes the matching sock from its collection of socks" do
        drawer.supply_match_for(second_red_sock)
        expect(drawer.socks).to_not include first_red_sock
      end

      it "removes exactly one sock from the drawer" do
        expect { drawer.supply_match_for(first_white_sock) }.to change { drawer.socks.length }.by(-1)
      end

    end

    context "when it has no matching socks" do
      it "returns nothing" do
        first_yellow_sock = Sock.new(brand: "Nike", style: "quarter", color: "yellow")

        expect(drawer.supply_match_for(first_yellow_sock)).to be_nil
      end
    end
  end

  describe "#supply_one_pair_of_socks", { supply_one_pair_of_socks: true } do
    context "when it has one or more pairs of matching socks" do
      it "returns one of its pairs of socks" do
        expect(drawer.supply_one_pair_of_socks).to match_array [first_white_sock, second_white_sock]
      end

      it "removes paired socks from its collection of socks" do
        drawer.supply_one_pair_of_socks

        [first_white_sock, second_white_sock].each do |paired_sock|
          expect(drawer.socks).to_not include paired_sock
        end
      end
    end

    context "when it has no pairs of matching socks" do
      it "returns a collection with no socks" do
        non_matching_socks = [first_white_sock, first_red_sock]
        drawer_with_no_matching_socks = SockDrawer.new(socks: non_matching_socks, matcher: matcher)

        expect(drawer_with_no_matching_socks.supply_one_pair_of_socks).to be_empty
      end
    end
  end
end
