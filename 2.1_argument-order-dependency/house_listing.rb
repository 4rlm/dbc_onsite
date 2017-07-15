class HouseListing
  attr_reader :address, :asking_price, :bedroom_count, :bathroom_count, :square_footage, :listing_type, :listing_id, :year_built

  def initialize(args)
    @address = args.fetch(:address) { false }
    @asking_price = args.fetch(:asking_price) { false }
    @square_footage = args.fetch(:square_footage) { false }
    @listing_type = args.fetch(:listing_type) { false }
    @listing_id = args.fetch(:listing_id) { false }
    @year_built = args.fetch(:year_built) { false }
    @bedroom_count = args.fetch(:bedroom_count) { 3 }
    @bathroom_count = args.fetch(:bathroom_count) { 2 }
    @active = args.fetch(:active) { true }
    @occupied = args.fetch(:occupied) { true }
  end

  def active?
    @active
  end

  def occupied?
    @occupied
  end
end

##### Runner #####

# listing_details = {
#   :address        => "1883 Atwood Rd, Toledo, OH 43615",
#   :asking_price   => "$75,000",
#   :square_footage => 1003,
#   :listing_type   => "single family",
#   :listing_id     => "5097751",
#   :year_built     => 1947,
#   :bedroom_count  => 2,
#   :bathroom_count => 1,
#   :active         => false,
#   :occupied       => false
# }

# house_listing = HouseListing.new(listing_details)
# puts house_listing.inspect
# puts house_listing.address
# puts house_listing.asking_price
# puts house_listing.square_footage
