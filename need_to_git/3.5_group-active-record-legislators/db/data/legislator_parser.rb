require 'csv'

module LegislatorParser
  def self.parse
    csv_data = []
    CSV.foreach('legislators.csv', headers: true, header_converters: :symbol) do |row|
      csv_data << row.to_h
    end
   # csv_data
   csv_data_segmenter(csv_data)
  end


  def self.csv_data_segmenter(csv_data)
    chamber_arr = []
    legislator_arr = []
    party_arr = []
    state_arr = []

    csv_data.each do |row|

      chamber_arr << {
        title: row[:title],
        chamber_name: row[:chamber]
      }

      legislator_arr << {
        birthday: row[:birthday],
        first_name: row[:first_name],
        middle_name: row[:middle_name],
        last_name: row[:last_name],
        name_suffix: row[:name_suffix],
        nickname: row[:nickname],
        term_start: row[:term_start],
        term_end: row[:term_end],
        in_office: row[:in_office],
        phone: row[:phone],
        twitter_id: row[:twitter_id]
      }

      party_arr << {
        party: row[:party]
      }

      state_arr << {
        state: row[:state],
        state_name: row[:state_name]
      }

      # to_db(chamber_arr, legislator_arr, party_arr, state_arr)

    end

    # puts "\n\n\n<<<<<<<<<<<<<\n\n\n"
    # # puts chamber_arr
    # puts "\n\n\n<<<<<<<<<<<<<\n\n\n"
    # puts legislator_arr
    # puts "\n\n\n<<<<<<<<<<<<<\n\n\n"
    # # puts party_arr
    # puts "\n\n\n<<<<<<<<<<<<<\n\n\n"
    # # puts state_arr
    # puts "\n\n\n<<<<<<<<<<<<<\n\n\n"

  end
# chamber_arr, legislator_arr, party_arr
  def self.to_db(state_arr)

    # chamber_arr.each do |cham|
    #   Chamber.new(name: "#{cham[:chamber_name]}", title: "#{cham[:title]}")
    # end

    # legislator_arr.each do |leg|
    #   Legislator.new(birthday: "#{leg[birthday]}", chamber_id: "#{leg[chamber_id]}", first_name: "#{leg[first_name]}", middle_name: "#{leg[middle_name]}", last_name: "#{leg[last_name]}", name_suffix: "#{leg}[name_suffix]}", nickname: "#{leg[nickname]}", party_id: "#{leg[party_id]}", state_id: "#{leg[state_id]}", term_start: "#{leg[term_start]}", term_end: "#{leg[term_end]}", in_office: "#{leg[in_office]}", phone: "#{leg[phone]}", twitter_id: "#{leg[twitter_id]}")
    # end

    # party_arr.each do |part|
    #   Party.new("#[part]", )
    # end

    # state_arr.each do |ste|
    #   State.new(state_name: "#{ste[state_name]}", state_abb: "#{ste[state_abb]}")
    # end

  end


end

#LegislatorParser.parse













