

td = [["first_name", "last_name", "city", "state"],
["Elisabeth", "Gardenar", "Toledo", "OH"],
["Jamaal", "Du", "Sylvania", "OH"],
["Kathlyn", "Lavoie", "Maumee", "OH"]]

def convert_table(td)
  res = []

  i = 1
  l = td.length

  while i < l
    h = td[0].zip(td[i]).to_h
    res << h
    i+=1
  end
  res
end

conversion = convert_table(td)

p conversion
