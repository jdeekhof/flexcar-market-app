class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if create_params[:category_id] == "0" && create_params[:category_name].present?
      category_id = Category.create_or_find_by!(name: create_params[:category_name]).id
    else
      category_id = create_params[:category_id]
    end
    cents_price_per_unit = ::DollarsToCentsConverter.call!(
      dollars: create_params[:dollars],
      cents: create_params[:cents]
    )
    product = Product.create!(
      name: create_params[:name],
      brand: create_params[:brand],
      category_id:,
      cents_price_per_unit:,
      units_of_sale: create_params[:units_of_sale],
      )
    flash.notice = "Product Saved!"
    redirect_to products_path
  end

  private

  def create_params
    params.require(:product).permit(
      :name,
      :brand,
      :category_id,
      :dollars,
      :cents,
      :units_of_sale,
      :category_name
    )
  end

  def handle_record_not_found(exception)
    record_not_found(exception:, path: new_product_path)
  end

  def handle_record_invalid(exception)
    record_invalid(exception:, path: products_path)
  end
end
