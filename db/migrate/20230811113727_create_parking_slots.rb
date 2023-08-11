class CreateParkingSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :parking_slots do |t|
      t.string :slot
      t.belongs_to :vehicle
      t.boolean :parked
      t.integer :entry_gate
      t.timestamps
    end
  end
end
