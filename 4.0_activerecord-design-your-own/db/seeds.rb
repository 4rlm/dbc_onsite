require 'csv'
module CsvImporter
  def self.parse(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      ###### One to Many should be above Many-Many.  Use .find_or_create_by ######

      # one_to_many_1 = OneToMany1.find_or_create_by({
      #   attribute_sym: row[:header_name],
      #   attribute_sym: row[:header_name]
      #   })
      # one_to_many_1.save

      # one_to_many_2 = OneToMany2.find_or_create_by({
      #  attribute_sym: row[:header_name],
      #  attribute_sym: row[:header_name]
      #  })
      # one_to_many_2.save

      # one_to_many_3 = OneToMany3.find_or_create_by({attribute_sym: row[:header_name]})
      # one_to_many_3.save

      ###########################################################################
      ###### Many to Many should be last.  Use .new ######
      # many_to_many = ManyToManyModel.new({
      #   attribute_sym: row[:header_name],
      #   attribute_sym: "#{one_to_many_1.id}",
      #   attribute_sym: row[:header_name]
      #   })
      # many_to_many.save

    end
  end
end

# file_path = 'db/data/csv_file_name.csv'
# CsvImporter.parse(file_path)
