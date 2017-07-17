class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_status, { limit:50 }
      t.string :date_ordered, { limit:50 }
      t.string :date_shipped, { limit:50 }
      t.string :date_received, { limit:50 }
      t.timestamps
    end
  end
end
