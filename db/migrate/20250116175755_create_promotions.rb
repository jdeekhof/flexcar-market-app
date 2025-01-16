class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :code, null: false, index: { unique: true }
      t.datetime :begins_at, null: false
      t.datetime :ends_at
      t.integer :minimum_quantity, null: false, default: 1
      t.integer :cents_discount_scalar, null: false
      t.integer :discount_type, null: false
      t.references :promotionable, null: false, polymorphic: true, index: true
      t.timestamps
    end
  end
end