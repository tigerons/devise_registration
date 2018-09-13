class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps
    end
    add_index :rooms, :recipient_id, unique: true
    add_index :rooms, :sender_id, unique: true
  end
end
