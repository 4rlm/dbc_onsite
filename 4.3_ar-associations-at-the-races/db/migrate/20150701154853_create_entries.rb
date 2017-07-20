class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.integer :race_id
      t.integer :jockey_id
      t.integer :horse_id

      t.timestamps
    end
  end
end
