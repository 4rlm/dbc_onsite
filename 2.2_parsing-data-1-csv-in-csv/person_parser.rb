require 'csv'
require_relative "person"

module PersonParser
  def self.parse(data_file)
    array = []
    puts "Loading CSV parser ..."

    CSV.foreach(data_file, headers: true, header_converters: :symbol) do |row|
      p row
      array << Person.new(row.to_hash)
    end
    array
  end

end
