class Vehicle < ActiveRecord::Base
  has_many :parking_slots
end
