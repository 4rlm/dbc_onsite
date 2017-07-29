class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :author
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
