require 'rails_helper'

RSpec.describe PromotionsController, type: :controller do
  describe '#new' do
    it 'will new up a promotion' do
      get :new
      expect(assigns(:promotion))
    end
  end

  describe '#create' do
    context 'when provided correct params' do
      let(:promo_code) { 'new_promotion' }
      let(:promotionable) { create(:product) }

      it 'will create a new promotion' do
        post :create, params:  {
          promotion: {
            code: promo_code,
            promotionable: "#{promotionable.class.name}##{promotionable.id}",
            begins_at: DateTime.now,
            ends_at: DateTime.now + 1.day,
            minimum_quantity: 1,
            discount_type: 0,
            discount_scalar: 100,
            discount_scalar_cents: 0,
          }
        }
        expect(Promotion.last.code).to eq(promo_code)
      end
    end
  end

  describe '#index' do
    context 'when there are promotions' do
      let!(:promo_one) { create(:promotion) }
      let!(:promo_two) { create(:promotion) }

      it 'will show all promotions' do
        get :index
        expect(assigns(:promotions).ids.include?([promo_one.id, promo_two.id]))
      end
    end
  end
end