class ProductsController < ApplicationController
  def index
    @products = Product.first(12)
    @items = {}
  end

  def new
    @product = Product.new
  end

  def create
  end

  def show
    @product = Product.find_by(id: params[:id])
    @items = {}
  end

  private

  def product_params
    params.require(:product).permit(:name, :image_url, :price, :description, :status)
  end
end
