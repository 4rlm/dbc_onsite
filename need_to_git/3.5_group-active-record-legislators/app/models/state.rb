class State < ApplicationRecord
  # Remember to create a migration!
   has_many :legislators, {foreign_key: :state_id}

   validates :state, :state_abb, { :presence => true }
end
