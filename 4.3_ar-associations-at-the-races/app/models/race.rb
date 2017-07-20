class Race < ApplicationRecord
  has_many :entries
  has_many :jockeys, through: :entries, source: :jockey
  has_many :horses, through: :entries, source: :horse
end
