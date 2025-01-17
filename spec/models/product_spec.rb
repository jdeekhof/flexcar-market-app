require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { create(:product) }

  context 'validations' do
    [ :name, :category, :units_of_sale, :cents_price_per_unit ].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    it { should validate_uniqueness_of(:name) }
    it { should define_enum_for(:units_of_sale).with_values([ :discrete, :gram, :pound, :ton ]) }
  end

  context 'associations' do
    it { should belong_to(:category) }
  end
end
