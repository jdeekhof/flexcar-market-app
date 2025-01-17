class Category < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, format: { with: /\A[a-z0-9\s]+\Z/i }
  has_many :products

  def full_quantity_in_cart(cart_items:)
    cart_items.where(product_id: self.products.ids).pluck(:quantity).sum
  end

  def add_promotion(promotion:, cart_items:)
    cart_items.where(product: products).each do
    |cart_item| cart_item.add_promotion(promotion)
    end
  end

  def least_expensive_price
    products.order(:cents_price_per_unit => :asc).first
  end
end