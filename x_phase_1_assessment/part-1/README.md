# Part 1:  Define a Class

## Summary

In this challenge you will be defining a class that represents a road trip. A
`RoadTrip` is made up of a collection of segments. A `RoadTrip` instance can
answer questions like:

* What is the total length of the trip?
* What is the average segment mileage?

## Tests

### Running the Specs

If you have questions on how to run the tests, please check the
[rspec-help](../rspec-help.md) document.

## Releases

### Release 0:  `RoadTrip` Class Attributes

In the tests for the `RoadTrip` class is an example group `"attributes"` that
contains tests for the desired attributes for a `RoadTrip` instance.  Run the
tests. Three tests should be failing.  Update the `RoadTrip class` in
`road_trip.rb` to make the tests pass.

### Release 1:  Working with Segments

In the tests for the `RoadTrip` class is an example group `"working with
segments"`.  The example group is currently marked as pending.

On Line 23, change `true` to `false`.  The line should then read ...

```ruby
describe 'working with segments', { pending: false } do
```

After making the change, run the tests to see the examples in this group fail.
Update the `RoadTrip class` in `road_trip.rb` to make the tests pass.

## Conclusion

Once all the tests have passed, you have completed Part 1 of the assessment.
If you haven't done so already, commit your changes and move on to Part 2.
