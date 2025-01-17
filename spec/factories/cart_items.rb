FactoryBot.define do
  factory :cart_item do
    cart { create(:cart) }
    product { create(:product) }
    quantity { rand(1...10) }
  end
end
