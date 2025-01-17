class CartsController < ApplicationController
  def new
    @cart = Cart.create!
  end

  def checkout
    @cart = Cart.find(cart_params[:id])
    @cart_items = @cart.cart_items.ordered_by_category
    @checkout = ::Checkout.new(cart: @cart)
  end

  def show
    @cart = Cart.find(cart_params[:id])
    @cart_items = @cart.cart_items.ordered_by_category
    @applicable_promotions = @cart.find_applicable_promotions
  end

  def index
    @carts = Cart.all
  end

  private

  def cart_params
    params.permit(:id)
  end

  def handle_record_not_found(exception)
    record_not_found(exception:, path: new_cart_path)
  end

  def handle_record_invalid(exception)
    record_invalid(exception:, path: cart_path(cart_params[:id]))
  end
end
