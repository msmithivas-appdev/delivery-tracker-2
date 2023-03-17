class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.date :arrival_date
      t.string :carrier
      t.string :tracking_number
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
