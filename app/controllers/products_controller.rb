class ProductsController < ApplicationController
  def index
    @products = Product.first(12)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
