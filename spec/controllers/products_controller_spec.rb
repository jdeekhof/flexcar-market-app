require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#new' do
    it 'will new up a promotion' do
      get :new
      expect(assigns(:product))
    end
  end

  describe '#create' do
    context 'when provided correct params' do
      let(:name) { 'newest iphone' }

      it 'will create a new promotion' do
        post :create, params: {
          product: {
            name:,
            brand: 'apple',
            dollars: 12,
            cents: 10,
            units_of_sale: 'discrete',
            category_id: '0',
            category_name: 'uncategorized'
          }
        }
        expect(response.status).to eq(302)
        expect(Product.last.name).to eq(name)
      end
    end
  end

  describe '#index' do
    context 'when there are promotions' do
      let!(:product_one) { create(:product) }
      let!(:product_two) { create(:product) }

      it 'will show all promotions' do
        get :index
        expect(assigns(:products).ids.include?([ product_one.id, product_two.id ]))
      end
    end
  end
end
