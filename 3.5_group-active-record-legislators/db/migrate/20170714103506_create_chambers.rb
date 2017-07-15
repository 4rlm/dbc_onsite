class CreateChambers < ActiveRecord::Migration[5.0]
  def change
    create_table :chambers do |t|
      t.string :chamber_name, { limit:25}
      t.string :title, { limit:10}
      t.timestamps
    end


  end
end
