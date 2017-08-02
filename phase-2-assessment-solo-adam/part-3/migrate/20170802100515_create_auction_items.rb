class Items < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_condition
      t.string :description
      t.decimal :opening_bid
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
