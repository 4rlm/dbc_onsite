require 'csv'
require_relative "person"

module PersonWriter

  def self.append(data_file, person)
    # Saves the data for each person
    # to the specified file.

    CSV.open(data_file, "a+") do |csv|
      csv << [person.first_name, person.last_name, person.email, person.phone, person.born_at]
    end

  end

end
