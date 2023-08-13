class Vehicle < ActiveRecord::Base
  has_one :parking_slot, foreign_key: 'vehicle_id'
end
