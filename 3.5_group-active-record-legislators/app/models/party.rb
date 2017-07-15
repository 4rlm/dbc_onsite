class Party < ApplicationRecord
  # Remember to create a migration!
 has_many :legislators, {foreign_key: :party_id}
 validates :party_name, { :presence => true }

 # scope :scope1, -> { where("party_name = 'R'") }

end
