class ParkingSlot < ApplicationRecord
  belongs_to :two_wheeler
  belongs_to :four_wheeler
end
