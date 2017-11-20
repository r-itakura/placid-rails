class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :sei
      t.string :mei
      t.string :sei_kana
      t.string :mei_kana
      t.string :email
      t.string :tel
      t.string :sex

      t.timestamps
    end
  end
end
