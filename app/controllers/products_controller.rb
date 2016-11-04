class ProductsController < ApplicationController
  def index
    @products = Product.first(12)
    @items = {}
  end

  def show
    @product = Product.find_by(id: params[:id])
    @items = {}
  end

  def add_to_cart
    session[:cart] =
    @product = Product.find_by(id: params[:id])
  end



  def remove_from_cart
  end
end
