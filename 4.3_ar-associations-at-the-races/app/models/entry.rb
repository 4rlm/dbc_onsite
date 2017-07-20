class Entry < ApplicationRecord
  # belongs_to :stallion, class_name: "Horse", foreign_key: "horse_id"
  belongs_to :horse
  belongs_to :jockey
  belongs_to :race


  # def ridden_in_races
  #   race_name = self.race.name
  #   race_name
  #
  # end

  # expect(@horse.ridden_in_races).to match_array [@entered_race_1, @entered_race_2]

  # split = name.split(' ', 2)
  # self.first_name = split.first
  # self.last_name = split.last


end
