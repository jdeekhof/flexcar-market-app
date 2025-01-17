require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  let(:cart) { create(:cart) }
  let(:product) { create(:product) }
  let(:promotion) { create(:promotion, promotionable: product) }

  describe '#create' do
    context 'with valid parameters' do
      it 'adds the product to the cart' do
        expect {
          post :create, params: { cart_id: cart.id, id: product.id, quantity: 2 }
        }.to change { cart.cart_items.count }.by(1)
      end

      it 'redirects to the cart path' do
        post :create, params: { cart_id: cart.id, id: product.id, quantity: 2 }
        expect(response).to redirect_to(cart_path(cart.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not add the product to the cart' do
        expect {
          post :create, params: { cart_id: cart.id, id:  Cart.count + 1 }
        }.not_to change { cart.cart_items.count }
      end

      it 'redirects to a new cart' do
        post :create, params: { cart_id: cart.id, id: Cart.count + 1  }
        expect(response).to redirect_to(new_cart_path)
      end
    end
  end

  describe '#update' do
    context 'with valid parameters' do
      let(:cart) { create(:cart) }
      let(:product) { create(:product) }
      let(:promotion) { create(:promotion, promotionable: product) }
      let!(:cart_item) { create(:cart_item, cart:, product:, promotion: nil) }

      it 'applies the promotion to promotionable cart items' do
        patch :update, params: { cart_id: cart.id, id: cart_item.id, promotion_id: promotion.id }
        expect(cart_item.reload.promotion_id).to be(promotion.id)
      end
    end

    context 'with invalid parameters' do
      let(:cart_item) { create(:cart_item, cart:, product:) }

      it 'does not apply the promotion' do
        put :update, params: { cart_id: cart.id, id: cart_item.id, promotion_id: nil }
      end

      it 'redirects to a new cart' do
        put :update, params: { cart_id: cart.id, id: cart_item.id, promotion_id: nil }
        expect(response).to redirect_to(new_cart_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:cart_item) { create(:cart_item, cart:, product:) }

    context 'with valid parameters' do
      it 'removes the product from the cart' do
        expect {
          delete :destroy, params: { cart_id: cart.id, id: product.id }
        }.to change { cart.cart_items.count }.by(-1)
      end

      it 'redirects to the cart path' do
        delete :destroy, params: { cart_id: cart.id, id: product.id }
        expect(response).to redirect_to(cart_path(cart))
      end
    end

    context 'with invalid parameters' do
      it 'does not remove any product from the cart' do
        expect {
          delete :destroy, params: { cart_id: cart.id, id: CartItem.count + 1 }
        }.not_to change { cart.cart_items.count }
      end

      it 'redirects to a new cart' do
        delete :destroy, params: { cart_id: cart.id, id: CartItem.count + 1 }
        expect(response).to redirect_to(new_cart_path)
      end
    end
  end
end
