require_relative "../orange"
require_relative "../orange_tree"


describe OrangeTree do
  let(:tree) { OrangeTree.new }

  #You'll need to switch `pending` to `describe` when you're ready
  # to implement each set of tests.

  describe "#age" do
    it "has an age" do
      expect(tree.age).to be_an(Integer)
    end
  end

  describe "#height" do
    it "has a height" do
      expect(tree.height).to be_an(Integer) || be_an(Float)
    end
  end

  describe "#pass_growing_season" do
    it "should change the age by 1 year per growing season" do
      expect {tree.pass_growing_season}.to change {tree.age}.from(0).to(1)
    end

    it "should make the tree grow 2.5 feet every growing season" do
      expect {tree.pass_growing_season}.to change{tree.height}.from(0).to(2.5)
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce oranges" do
        expect {6.times do tree.pass_growing_season end}.to change{tree.has_oranges?}.to eq true
      end
    end
  end

  describe "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
      expect {6.times do tree.pass_growing_season end}.to change{tree.mature?}.to eq true
    end

    it "returns false if tree is not old enough to bear fruit" do
    end
  end

  describe "#dead?" do
    it "should return false for an alive tree" do
        70.times do tree.pass_growing_season end
        expect(tree.dead?).to eq false
    end

    it "should return true for a dead tree" do
      110.times do tree.pass_growing_season end
      expect(tree.dead?).to eq true
    end
  end

  describe '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
      70.times do tree.pass_growing_season end
      expect(tree.has_oranges?).to eq true
    end

    it "should return false if the tree has no oranges" do
      5.times do tree.pass_growing_season end
      expect(tree.has_oranges?).to eq false
    end
  end

  describe "#pick_an_orange" do
    it "should return an orange from the tree" do
      70.times do tree.pass_growing_season end
      expect(tree.pick_an_orange).to be_an(Orange)
    end

    it "the returned orange should no longer be on the tree" do
      70.times do tree.pass_growing_season end
      expect { tree.pick_an_orange }.to change {tree.oranges}
    end

    it "should raise an error if the tree has no oranges" do
      5.times do tree.pass_growing_season end
      expect{ tree.pick_an_orange } .to raise_error(OrangeTree::NoOrangesError)
    end
  end
end