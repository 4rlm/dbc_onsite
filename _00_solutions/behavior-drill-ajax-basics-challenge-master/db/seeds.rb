require 'csv'

Muppet.destroy_all

CSV.foreach('db/muppets.csv', headers: true, header_converters: :symbol) do |row|
  Muppet.create!(row.to_h)
end
