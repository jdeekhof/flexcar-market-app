require 'rails_helper'

RSpec.describe Promotion, type: :model do
  subject { create(:promotion) }
  context 'validations' do
    it { should validate_uniqueness_of(:code) }
    [ :code, :begins_at, :minimum_quantity, :discount_type ].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
    it { should validate_numericality_of(:cents_discount_scalar) }
  end

  context 'associations' do
    it { should belong_to(:promotionable) }
  end
end
