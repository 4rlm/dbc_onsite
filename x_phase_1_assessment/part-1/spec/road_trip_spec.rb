require_relative '../road_trip'
require_relative '../segment'

RSpec.describe RoadTrip do
  let(:segments) { [Segment.new(miles: 500), Segment.new(miles: 750)] }
  let(:road_trip) { RoadTrip.new(name: 'Trip to SF', segments: segments) }

  describe 'attributes' do
    it 'has a name' do
      expect(road_trip.name).to eq 'Trip to SF'
    end

    it 'allows updates to name' do
      road_trip.name = 'Trip to NYC'
      expect(road_trip.name).to eq 'Trip to NYC'
    end

    it 'has segments' do
      expect(road_trip.segments).to match_array segments
    end
  end

  describe 'working with segments', { pending: false } do
    describe '#add_segment' do
      it 'adds object to segement collection' do
        new_segment = Segment.new
        road_trip.add_segment(new_segment)
        expect(road_trip.segments).to include new_segment
      end

      it 'retains segments already in the segment collection' do
        original_segments = road_trip.segments.dup
        new_segment = Segment.new
        road_trip.add_segment(new_segment)
        expect(road_trip.segments).to match_array (original_segments + [new_segment])
      end
    end

    describe 'distance calculations' do
      describe '#total_miles' do
        it 'sums the miles of each segment' do
          expect(road_trip.total_miles).to eq 1250
        end
      end

      describe '#average_miles_per_segment' do
        it 'averages the miles of the trip over the segments' do
          expect(road_trip.average_miles_per_segment).to eq 625
        end
      end
    end
  end
end
