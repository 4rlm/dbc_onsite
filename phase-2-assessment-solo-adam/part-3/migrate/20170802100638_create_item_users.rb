class CreateItemUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.timestamps
    end

    create_table :items do |t|
      t.string :item_name
      t.string :item_condition
      t.string :description
      t.decimal :opening_bid
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end

    create_table :item_users do |t|
      t.belongs_to :item, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end

  end
end
