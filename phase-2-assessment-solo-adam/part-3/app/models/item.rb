class Item < ActiveRecord::Base
  has_many :joined_item_users
  has_many :users, through: :joined_item_users
end
