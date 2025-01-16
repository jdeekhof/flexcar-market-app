FactoryBot.define do
  factory :promotion do
    code { Faker::Alphanumeric.alpha(number: 10) }
    begins_at { DateTime.now - 1.days }
    ends_at { DateTime.now + 1.days }
    cents_discount_scalar { rand(1000) }
    discount_type { rand(3) }
    promotionable { create(:product) }
  end
end
