class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :item_name, { limit:50 }
      t.string :price, { limit:50 }
      t.string :description, { limit:50 }
      t.timestamps
    end
  end
end
