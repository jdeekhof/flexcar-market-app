require 'rails_helper'
RSpec.describe CartsController, type: :controller do
  let(:cart) { create(:cart) }

  describe '#new' do
    it 'creates a new cart' do
      expect {
        get :new
      }.to change { Cart.count }.by(1)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#checkout' do
    context 'with valid cart ID' do
      let!(:cart_items) { create_list(:cart_item, 3, cart:) }

      it 'assigns the cart and ordered cart items' do
        get :checkout, params: { id: cart.id }
        expect(assigns(:cart)).to eq(cart)
        expect(assigns(:cart_items)).to match_array(cart.cart_items.ordered_by_category)
      end
    end

    context 'with invalid cart ID' do
      it 'redirects to the new cart path' do
        get :checkout, params: { id: 0 }
        expect(response).to redirect_to(new_cart_path)
      end
    end
  end

  describe '#show' do
    context 'with valid cart ID' do
      let!(:cart_items) { create_list(:cart_item, 3, cart:) }

      it 'assigns the cart and ordered cart items' do
        get :show, params: { id: cart.id }
        expect(assigns(:cart)).to eq(cart)
        expect(assigns(:cart_items)).to match_array(cart.cart_items.ordered_by_category)
      end
    end

    context 'with invalid cart ID' do
      it 'redirects to the new cart path' do
        get :show, params: { id: 0 }
        expect(response).to redirect_to(new_cart_path)
      end
    end
  end

  describe '#index' do
    let!(:carts) { create_list(:cart, 3) }

    it 'assigns all carts' do
      get :index
      expect(assigns(:carts)).to match_array(Cart.all)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
