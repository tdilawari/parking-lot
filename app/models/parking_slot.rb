class ParkingSlot < ApplicationRecord
  belongs_to :vehicle, dependent: :destroy
end
