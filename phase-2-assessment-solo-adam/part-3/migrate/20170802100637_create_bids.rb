class Bids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :buyer_bid

      t.timestamps
    end
  end
end
