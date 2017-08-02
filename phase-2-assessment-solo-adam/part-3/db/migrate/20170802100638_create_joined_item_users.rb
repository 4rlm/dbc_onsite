class CreateJoinedItemUsers < ActiveRecord::Migration
  def change
    create_table :joined_item_users do |t|
      t.belongs_to :item, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end

  end
end
