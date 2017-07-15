class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string :party_name, { limit:25}
      t.timestamps
    end

  end
end
