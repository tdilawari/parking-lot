FactoryBot.define do
  factory :parking_slot do
    slot { "A02"}
    parked { true }
    association :vehicle, factory: :vehicle
  end
end