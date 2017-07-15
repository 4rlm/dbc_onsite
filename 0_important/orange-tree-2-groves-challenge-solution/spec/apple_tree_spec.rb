require_relative "../apple"
require_relative "../apple_tree"


describe AppleTree do
  let(:tree) { AppleTree.new }

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

    it "should make the tree grow 2 feet every growing season" do
      expect {tree.pass_growing_season}.to change{tree.height}.from(0).to(2)
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce apple" do
        expect {6.times do tree.pass_growing_season end}.to change{tree.has_apples?}.to eq true
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
        40.times do tree.pass_growing_season end
        expect(tree.dead?).to eq false
    end

    it "should return true for a dead tree" do
      60.times do tree.pass_growing_season end
      expect(tree.dead?).to eq true
    end
  end

  describe '#has_apples?' do
    it 'should return true if oranges are on the tree' do
      40.times do tree.pass_growing_season end
      expect(tree.has_apples?).to eq true
    end

    it "should return false if the tree has no oranges" do
      4.times do tree.pass_growing_season end
      expect(tree.has_apples?).to eq false
    end
  end

  describe "#pick_an_apple" do
    it "should return an apple from the tree" do
      40.times do tree.pass_growing_season end
      expect(tree.pick_an_apple).to be_an(Apple)
    end

    it "the returned apple should no longer be on the tree" do
      40.times do tree.pass_growing_season end
      expect { tree.pick_an_apple }.to change {tree.apples}
    end

    it "should raise an error if the tree has no apples" do
      4.times do tree.pass_growing_season end
      expect{ tree.pick_an_apple } .to raise_error(AppleTree::NoApplesError)
    end
  end
end