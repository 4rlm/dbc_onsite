class CreateLegislators < ActiveRecord::Migration[5.0]
  def change
    create_table :legislators do |t|
      t.string :birthday, { limit: 10}
      t.integer :chamber_id, { limit:10}
      t.string :first_name, { limit:50}
      t.string :middle_name, {limit:50}
      t.string :last_name, { limit:50}
      t.string :name_suffix, {limit:50}
      t.string :nickname, {limit:50}
      t.integer :party_id, { limit:3}
      t.integer :state_id, { limit:50}
      t.string :term_start, { limit:10}
      t.string :term_end, { limit:10}
      t.string :in_office, { limit:50}
      t.string :phone, {limit:50}
      t.string :twitter_id, {limit:50}
      t.timestamps
    end
  end
end
