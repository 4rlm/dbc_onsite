
def generate_roster
  roster = []
end

roster = generate_roster

headers = ['Number', 'Name', 'Position', 'Points per Game']
roster[0] = headers

numbers = [12, 9, 31, 18, 22]
names = ['Joe Schmo', 'Ms. Buckets', 'Harvey Kay', 'Sally Talls', 'MK DiBoux']
positions = ['Center', 'Point Guard', 'Shooting Guard', 'Power Forward', 'Small Forward']
scores = [[14, 32, 7, 0, 23], [19, 0, 11, 22, 0], [0, 30, 16, 0, 25], [18, 29, 26, 31, 19], [11, 0, 23, 17, 0]]


def length_tester(roster, input)
  n = input.length - roster.length+1
  n.times{roster << Array.new}
  roster
end


def adder(roster, input)
  i = 0
  while i < input.length
    roster[i+1] << input[i]
    i+=1
  end
  roster
end


length_tester(roster, numbers)
length_tester(roster, names)
length_tester(roster, positions)
length_tester(roster, scores)

adder(roster, numbers)
adder(roster, names)
adder(roster, positions)
adder(roster, scores)

p roster
