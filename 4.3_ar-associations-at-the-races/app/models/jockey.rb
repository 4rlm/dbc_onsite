class Jockey < ApplicationRecord
  has_many :entries
  has_many :races, through: :entries
  has_many :entered_races, through: :entries, source: :race
  has_many :ridden_horses, through: :entries, source: :horse

end
