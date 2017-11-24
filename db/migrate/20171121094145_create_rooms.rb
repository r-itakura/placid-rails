class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.integer :plan_id
      t.string :room_no
      t.boolean :smoke_flag
      t.string :bed_type
      t.boolean :usable_flag
      t.integer :maximum_capacity

      t.timestamps
    end
  end
end
