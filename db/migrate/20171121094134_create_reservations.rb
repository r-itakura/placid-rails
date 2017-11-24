class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :hotel_id
      t.integer :guest_id
      t.integer :plan_id
      t.integer :guest_num
      t.date :reserve_date
      t.integer :reserve_date_num
      t.integer :price
      t.boolean :cancel_flag
      t.integer :room_id

      t.timestamps
    end
  end
end
