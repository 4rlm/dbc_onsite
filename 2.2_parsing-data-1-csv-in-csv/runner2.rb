require_relative 'person'
require_relative 'person_parser'

people = PersonParser.parse('people.csv')

puts people[0].first_name
puts people[0].born_at
puts DateTime.parse(people[0].born_at)
