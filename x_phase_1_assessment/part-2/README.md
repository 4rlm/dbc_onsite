# Part 2: Work with a Collection

## Summary

In this part of the assessment, we are going to be working with a collection of
objects.  We've been provided three classes and tests that describe the
behaviors of the classes.  Take a look at the provided code before moving on to
completing this part of the assessment.

### `Sock` and `SockMatcher`

The `Sock` and `SockMatcher` classes have been written for us.  Furthermore,
tests have been provided that describe the behaviors of these classes.  Read
the code for these classes and the test code because we'll be working with
these objects later.

### `SockDrawer`

The `SockDrawer` class is somewhat complete.  We can initialize an instance of
`SockDrawer` with a collection of socks and a matcher.  The challenge for this
part of the assessment is to write methods that provide a `SockDrawer` instance
with ways of interacting with its socks.  The desired behaviors have been
described in tests, but are summarized here, in English:

- A drawer will be able to match a given sock to one of the socks in its
  collection, return the matched sock, and ensure the matched sock is removed
  from the collection. If no match is found, this method should return `nil`.
  This method should be called `SockDrawer#supply_match_for`.
- A sock drawer will be able to produce an arbitrary pair of matched socks, return
  that pair, and ensure the two socks of the pair are removed from the
  collection. This method will be called `SockDrawer#supply_one_pair_of_socks`.

The releases will guide you through using RSpec to help validate that your
implementation meets these provided expectations.

## Running the Tests

If you have questions on how to run the tests, please check the
[rspec-help](../rspec-help.md) document.

## Releases

### Release 0: `SockDrawer#supply_match_for`

Pretend we have a single sock and we need to find a match for it.  We believe
that a matching sock is located in the sock drawer.  So, we're going to ask the
sock drawer to give us a match for our sock.

A group of tests is provided to describe how an instance of `SockDrawer`
behaves when told to supply a match for a sock.  This group of tests is
[tagged][] `supply_match_for`.  To run the tests specific to the
`#supply_match_for` method, from the root directory run:


```
rspec --tag supply_match_for
```

The six tests in the example group should be failing.  Update the
`SockDrawer` class in `sock_drawer.rb` to make the tests pass.

**Do not modify the tests and do not modify the SockMatcher class.**

### Release 1:  `SockDrawer#supply_one_pair_of_socks`

Now pretend we need a pair of socks.  We don't have any particular sock for the
sock drawer to match.  Instead, we want the sock drawer to give us any pair of
socks that it can find among its socks.

A group of tests is provided to describe how an instance of `SockDrawer`
behaves when told to supply an arbitrary pair of socks.  This group of tests is
[tagged][] `supply_one_pair_of_socks`.  To run the tests specific to the
`#supply_one_pair_of_socks` method, from the root directory run:

```
rspec --tag supply_one_pair_of_socks
```

Update the `SockDrawer` class in `sock_drawer.rb` to make the tests pass.

**Do not modify the tests and do not modify the SockMatcher class.**

## Conclusion

Once all the tests have passed, you have completed Part 2 of the assessment.  If you haven't done so already, commit your changes and move on to Part 3.

[tagged]: https://www.relishapp.com/rspec/rspec-core/v/2-4/docs/command-line/tag-option
