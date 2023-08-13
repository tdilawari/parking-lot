FactoryBot.define do
  factory :vehicle do
    color { "red"}
    registeration_number { "PB081122" }
    type {"TwoWheeler"}
  end

  factory :two_wheeler do
    color { "black"}
    registeration_number { "PB081100" }
    type {"TwoWheeler"}
  end

  factory :four_wheeler do
    color { "white"}
    registeration_number { "PB081112" }
    type {"FourWheeler"}
  end
end