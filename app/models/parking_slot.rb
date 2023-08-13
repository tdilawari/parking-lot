class ParkingSlot < ApplicationRecord
  belongs_to :two_wheeler, foreign_key: 'vehicle_id', dependent: :destroy, optional: true
  belongs_to :four_wheeler, foreign_key: 'vehicle_id', dependent: :destroy, optional: true
  belongs_to :vehicle, foreign_key: 'vehicle_id', dependent: :destroy, optional: true
end
