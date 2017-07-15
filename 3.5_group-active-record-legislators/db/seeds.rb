require 'csv'

# require 'pry'
module LegislatorParser
  def self.parse
    csv_data = []
    CSV.foreach('db/data/legislators.csv', headers: true, header_converters: :symbol) do |row|

     state = State.find_or_create_by({
      state: row[:state_name],
      state_abb: row[:state]})
     state.save

      chamber = Chamber.find_or_create_by({
        chamber_name: row[:chamber],
        title: row[:title]})
       chamber.save

      party = Party.find_or_create_by({party_name: row[:party]})
      party.save



      legislator = Legislator.new({
        birthday: row[:birthday],
        chamber_id: "#{chamber.id}",
        first_name: row[:first_name],
        middle_name: row[:middle_name],
        last_name: row[:last_name],
        name_suffix: row[:name_suffix],
        nickname: row[:nickname],
        party_id: "#{party.id}",
        state_id: "#{state.id}",
        term_start: row[:term_start],
        term_end: row[:term_end],
        in_office: row[:in_office],
        phone: row[:phone],
        twitter_id: row[:twitter_id]
        })

      legislator.save
    end
  end
end

LegislatorParser.parse

