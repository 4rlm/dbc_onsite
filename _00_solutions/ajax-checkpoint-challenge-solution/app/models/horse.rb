class Horse < ApplicationRecord

  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
end
