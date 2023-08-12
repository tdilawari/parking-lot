class Vehicle < ActiveRecord::Base
  has_many :parking_slots
  validates :color, presence: true
  validates :registeration_number, presence: true
end
