class User < ActiveRecord::Base
  has_many :joined_item_users
  has_many :items, through: :joined_item_users
end
