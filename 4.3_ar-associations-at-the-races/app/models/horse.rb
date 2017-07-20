class Horse < ApplicationRecord
  has_many :entries
  has_many :ridden_in_races, through: :entries, source: :race

  has_many :carried_jockeys, through: :entries, source: :jockey

end
