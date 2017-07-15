require_relative '../convert_table'

describe 'convert_table to hashes' do
  let(:td) {[["first_name", "last_name", "city", "state"],
  ["Elisabeth", "Gardenar", "Toledo", "OH"],
  ["Jamaal", "Du", "Sylvania", "OH"],
  ["Kathlyn", "Lavoie", "Maumee", "OH"]]}

  let(:conversion) {convert_table(td)}

  it 'converts table to hashes in array' do
    h1 = {"first_name"=>"Elisabeth", "last_name"=>"Gardenar", "city"=>"Toledo", "state"=>"OH"}
    expect(conversion[0]).to eq h1
  end

  it 'converts table to hashes in array' do
    h2 = { "first_name" => "Jamaal", "last_name" => "Du", "city" => "Sylvania", "state" => "OH" }
    expect(conversion[1]).to eq h2
  end

  it 'converts table to hashes in array' do
    h3 = { "first_name" => "Kathlyn", "last_name" => "Lavoie", "city" => "Maumee", "state" => "OH" }
    expect(conversion[2]).to eq h3
  end

end

# table_data = [
#   ["first_name", "last_name", "city", "state"],
#   ["Elisabeth", "Gardenar", "Toledo", "OH"],
#   ["Jamaal", "Du", "Sylvania", "OH"],
#   ["Kathlyn", "Lavoie", "Maumee", "OH"]
# ]
#
# convert_table(table_data)
# => [
#  { "first_name" => "Elisabeth", "last_name" => "Gardenar", "city" => "Toledo", "state" => "OH" },
#  { "first_name" => "Jamaal", "last_name" => "Du", "city" => "Sylvania", "state" => "OH" },
#  { "first_name" => "Kathlyn", "last_name" => "Lavoie", "city" => "Maumee", "state" => "OH" }
# ]
