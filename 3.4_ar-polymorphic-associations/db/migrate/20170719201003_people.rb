class People < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :given_name, {null: false, limit: 50}
      t.string :surname, {null: false, limit: 50}
      t.string :email, { limit: 50}
      t.string :phone, {null: false, limit: 20}
      t.date :birthday, { limit: 50}
      
      t.timestamps
    end
  end
end