class TwoWheeler < Vehicle
  has_one :parking_slot, foreign_key: 'vehicle_id'
end
