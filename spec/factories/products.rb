FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    category { create(:category) }
    units_of_sale { rand(4) }
    cents_price_per_unit { rand(10000) }
  end
end
