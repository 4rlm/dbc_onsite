class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :state, { limit:50}
      t.string :state_abb, { limit:2}
      t.timestamps
    end

  end
end
