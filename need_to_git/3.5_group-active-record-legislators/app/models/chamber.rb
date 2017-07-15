class Chamber < ApplicationRecord
  # Remember to create a migration!
  has_many :legislators, {foreign_key: :chamber_id}
  validates :chamber_name, :title, { :presence => true }
end
