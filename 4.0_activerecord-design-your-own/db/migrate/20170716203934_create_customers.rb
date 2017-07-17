class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name, { limit:50 }
      t.string :last_name, { limit:50 }
      t.string :street, { limit:50 }
      t.string :city, { limit:50 }
      t.string :state, { limit:50 }
      t.string :zip, { limit:50 }
      t.string :phone, { limit:50 }
      t.string :email, { limit:50 }
      t.timestamps
    end
  end
end
