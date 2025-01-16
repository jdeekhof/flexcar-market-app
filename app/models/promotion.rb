class Promotion < ApplicationRecord
  validates_uniqueness_of :code
  validates_presence_of :code, :begins_at, :minimum_quantity, :discount_type
  validates :cents_discount_scalar, numericality: { more_than: 0 }
  validates :begins_at, comparison: { less_than: :ends_at }, if: :ends_at
  enum :discount_type, [ :flat, :percentage, :buy_x_get_y ]
  belongs_to :promotionable, polymorphic: true
end
